INSERT INTO Datasets VALUES (3, 'Iris', 'https://archive.ics.uci.edu/ml/datasets/iris', 150);

SELECT * FROM Projects WHERE start_date >= '2023-01-01' AND end_date <= '2023-12-31';

UPDATE Experiments SET start_time = '2023-01-03 00:00:00', end_time = '2023-01-03 01:00:00' WHERE experiment_id = 1;

DELETE FROM ExperimentResults WHERE value < 0.9;

INSERT INTO Metrics VALUES (3, 'Accuracy', 'This is metric 3');

SELECT algorithm_name, COUNT(*) AS num_experiments
FROM Algorithms INNER JOIN ExperimentAlgorithms ON Algorithms.algorithm_id = ExperimentAlgorithms.algorithm_id
GROUP BY algorithm_name;

UPDATE Projects SET end_date = '2023-11-30' WHERE project_id = 2;

DELETE FROM ExperimentDatasets WHERE experiment_id = 1;

INSERT INTO Experiments VALUES (3, 2, '2023-02-01 00:00:00', '2023-02-01 01:00:00');

SELECT p.project_name, COUNT(*) AS num_experiments
FROM Projects p INNER JOIN Experiments e ON p.project_id = e.project_id
GROUP BY p.project_name;
