-- Этот запрос отображает проекты, для которых было проведено более одного эксперимента.

SELECT project_id, COUNT(*) AS num_experiments
FROM Experiments
GROUP BY project_id
HAVING COUNT(*) > 1;


-- Этот запрос возвращает все наборы данных, отсортированные по размеру в порядке убывания.
SELECT * FROM Datasets
ORDER BY size DESC;

-- Этот запрос возвращает количество экспериментов для каждого проекта с использованием оконной функции.

SELECT project_id, COUNT(*) OVER(PARTITION BY project_id) AS num_experiments
FROM Experiments;

-- Этот запрос возвращает ранг каждого эксперимента, основанный на времени начала.
SELECT experiment_id, RANK() OVER(ORDER BY start_time) AS rank
FROM Experiments;

-- Этот запрос возвращает идентификатор предыдущего эксперимента в рамках каждого проекта, основываясь на времени начала.
SELECT experiment_id, project_id, LAG(experiment_id) OVER(PARTITION BY project_id ORDER BY start_time) AS previous_experiment_id
FROM Experiments;

-- Этот запрос возвращает количество экспериментов и ранг каждого эксперимента в рамках каждого проекта.
SELECT project_id, COUNT(*) OVER(PARTITION BY project_id) AS num_experiments,
RANK() OVER(PARTITION BY project_id ORDER BY start_time) AS rank
FROM Experiments;