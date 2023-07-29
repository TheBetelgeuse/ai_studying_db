import sqlite3

conn = sqlite3.connect('test.db')
c = conn.cursor()

# Запрос 1: GROUP BY + HAVING
query1 = """
SELECT project_id, COUNT(*) AS num_experiments 
FROM Experiments 
GROUP BY project_id 
HAVING COUNT(*) > 1;
"""

c.execute(query1)
results1 = c.fetchall()

for row in results1:
    assert row[1] > 1

# Запрос 2: ORDER BY
query2 = """
SELECT * FROM Datasets 
ORDER BY size DESC;
"""
c.execute(query2)
results2 = c.fetchall()
for i in range(len(results2) - 1):
    assert results2[i][3] >= results2[i+1][3]


# Запрос 3: PARTITION BY
query3 = """
SELECT project_id, COUNT(*) OVER (PARTITION BY project_id) as num_experiments 
FROM Experiments;
"""
c.execute(query3)
results3 = c.fetchall()
project_counts = {}
for row in results3:
    if row[0] in project_counts:
        assert row[1] == project_counts[row[0]]
    else:
        project_counts[row[0]] = row[1]


# Запрос 4: ORDER BY (внутри OVER)
query4 = """
SELECT experiment_id, project_id, start_time, 
       RANK() OVER (PARTITION BY project_id ORDER BY start_time) as rank 
FROM Experiments;
"""
c.execute(query4)
results4 = c.fetchall()
project_ranks = {}
for row in results4:
    if row[1] in project_ranks:
        assert row[3] > project_ranks[row[1]]
    project_ranks[row[1]] = row[3]

# Запрос 5: PARTITION BY + ORDER BY
query5 = """
SELECT experiment_id, project_id, start_time, 
       ROW_NUMBER() OVER (PARTITION BY project_id ORDER BY start_time) as row_number 
FROM Experiments;
"""
c.execute(query5)
results5 = c.fetchall()
project_row_numbers = {}
for row in results5:
    if row[1] in project_row_numbers:
        assert row[3] > project_row_numbers[row[1]]
    project_row_numbers[row[1]] = row[3]

# Запрос 6: агрегирующие, ранжирующие, смещения
query6 = """
SELECT project_id, 
       AVG(value) OVER (PARTITION BY project_id) as avg_value,
       RANK() OVER (ORDER BY AVG(value) OVER (PARTITION BY project_id) DESC) as rank,
       LAG(value) OVER (ORDER BY experiment_id) as prev_value
FROM ExperimentResults;
"""
c.execute(query6)
results6 = c.fetchall()


for i in range(len(results6) - 1):
    assert results6[i][1] >= 0
    assert results6[i][2] <= results6[i+1][2]
    if results6[i][3] is not None:  # проверка для первого значения, которое будет None
        assert results6[i][3] <= results6[i][1]  # предыдущее значение не больше текущего


conn.close()