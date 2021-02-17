# Managing Jobs

## Get a Job

```python
    my_project = c.get_project(id="project_123")

    my_project.get_job(id="abc_123")
```

Default response:

```shell
    VerticalLinearRegressionJob(id=abc_123, job_type=LINEAR_REGRESSION, status=Created)
```

## Submit a job

```python
    my_project = c.get_project(id="project_123")

    dataview_1 = my_project.get_dataview(uri="s3://my-data.csv")
    dataview_2 = my_project.get_dataview(uri="s3://my-data-2.csv")

    lr_job = VerticalLinearRegressionJob(
        x_train_dataview=dataview_1,
        y_train_dataview=dataview_2,
    )
    my_project.submit_job(job=lr_job)
```

Default response:

```shell
    VerticalLinearRegressionJob(id=abc_123, job_type=LINEAR_REGRESSION, status=Created)
```