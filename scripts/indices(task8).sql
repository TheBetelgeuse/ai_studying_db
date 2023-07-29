CREATE INDEX idx_experiments_project_id ON Experiments (project_id);

CREATE INDEX idx_experiment_results_experiment_id ON ExperimentResults (experiment_id);

CREATE INDEX idx_datasets_dataset_name ON Datasets (dataset_name);

CREATE INDEX idx_projects_project_name ON Projects (project_name);

CREATE INDEX idx_experiment_datasets_dataset_id ON ExperimentDatasets (dataset_id);
