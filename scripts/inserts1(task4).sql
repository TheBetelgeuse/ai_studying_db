INSERT INTO Datasets VALUES (1, 'Titanic', 'https://www.kaggle.com/competitions/titanic', 10000);
INSERT INTO Datasets VALUES (2, 'Boston', 'http://lib.stat.cmu.edu/datasets/boston', 20000);

INSERT INTO Projects VALUES (1, 'RegressionEducational', 'first project', '2023-01-01', '2023-12-31');
INSERT INTO Projects VALUES (2, 'SimpleNNEducational', 'second project', '2023-02-01', '2023-12-31');

INSERT INTO Algorithms VALUES (1, 'Linear Regression', 'This is algorithm 1', 'Type 1');
INSERT INTO Algorithms VALUES (2, 'Backprop', 'This is algorithm 2', 'Type 2');

INSERT INTO Metrics VALUES (1, 'MSE', 'This is metric 1');
INSERT INTO Metrics VALUES (2, 'MAPE', 'This is metric 2');

INSERT INTO Experiments VALUES (1, 1, '2023-01-01 00:00:00', '2023-01-01 01:00:00');
INSERT INTO Experiments VALUES (2, 1, '2023-01-02 00:00:00', '2023-01-02 01:00:00');

INSERT INTO ExperimentResults VALUES (1, 1, 1, true, 'Студенты освоили данную модель обучения', 0.95);
INSERT INTO ExperimentResults VALUES (2, 1, 2, false, 'Студентам тяжело давалось использование нелинейных моделей', 0.85);

INSERT INTO ExperimentAlgorithms VALUES (1, 1);
INSERT INTO ExperimentAlgorithms VALUES (2, 2);

INSERT INTO ExperimentMetrics VALUES (1, 1);
INSERT INTO ExperimentMetrics VALUES (2, 2);

INSERT INTO ExperimentDatasets VALUES (1, 1);
INSERT INTO ExperimentDatasets VALUES (2, 2);
