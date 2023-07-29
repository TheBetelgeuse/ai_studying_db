CREATE TABLE Datasets (
    dataset_id INTEGER PRIMARY KEY,
    dataset_name VARCHAR(128) DEFAULT "data",
    URL TEXT,
    size BIGINT
);

CREATE TABLE Projects (
    project_id INTEGER PRIMARY KEY,
    project_name VARCHAR(128) DEFAULT "project",
    description TEXT,
    start_date DATE,
    end_date DATE
);

CREATE TABLE Algorithms (
    algorithm_id INTEGER PRIMARY KEY,
    algorithm_name VARCHAR(128) DEFAULT "Lienear Regressions",
    description TEXT,
    type VARCHAR(128)
);

CREATE TABLE Metrics (
    metric_id INTEGER PRIMARY KEY,
    metric_name VARCHAR(128) DEFAULT "MSE",
    description TEXT
);

CREATE TABLE Experiments (
    experiment_id INTEGER PRIMARY KEY,
    project_id INTEGER,
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    FOREIGN KEY(project_id) REFERENCES Projects(project_id)
);

CREATE TABLE ExperimentResults (
    experiment_id INTEGER PRIMARY KEY,
    project_id INTEGER,
    metric_id INTEGER,
    hypothesis_confirmation BOOL,
    comment TEXT,
    value DECIMAL(10, 2),
    FOREIGN KEY(experiment_id) REFERENCES Experiments(experiment_id),
    FOREIGN KEY(project_id) REFERENCES Projects(project_id),
    FOREIGN KEY(metric_id) REFERENCES Metrics(metric_id)
);

CREATE TABLE ExperimentAlgorithms (
    algorithm_id INTEGER,
    experiment_id INTEGER,
    FOREIGN KEY(algorithm_id) REFERENCES Algorithms(algorithm_id),
    FOREIGN KEY(experiment_id) REFERENCES Experiments(experiment_id)
);

CREATE TABLE ExperimentMetrics (
    metric_id INTEGER,
    experiment_id INTEGER,
    FOREIGN KEY(metric_id) REFERENCES Metrics(metric_id),
    FOREIGN KEY(experiment_id) REFERENCES Experiments(experiment_id)
);

CREATE TABLE ExperimentDatasets (
    dataset_id INTEGER,
    experiment_id INTEGER,
    FOREIGN KEY(dataset_id) REFERENCES Datasets(dataset_id),
    FOREIGN KEY(experiment_id) REFERENCES Experiments(experiment_id)
);