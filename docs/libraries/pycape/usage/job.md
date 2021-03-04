# Managing Jobs

## Submit a job

```python
    my_project = c.get_project(id="project_123")

    dataview_1 = my_project.get_dataview(uri="s3://my-data.csv")
    dataview_2 = my_project.get_dataview(uri="s3://my-data-2.csv")

    vlr = VerticallyPartitionedLinearRegression(
        x_train_dataview=dataview_1,
        y_train_dataview=dataview_2,
    )
    my_project.submit_job(job=vlr)
```

Default response:

```shell
    Job(id=abc_123, job_type=LINEAR_REGRESSION, status=Created)
```

## Get a Job's Status

```python
    lr_job = my_project.get_job(id="abc_123")

    lr_job.get_status()
```

Default response:

```shell
    Created
```

## Get a Job's Results

```python
    lr_job = my_project.get_job(id="abc_123")

    weights, metrics = lr_job.get_results()
```

Default response:

```shell
    (array([12.14955139,  1.96560669]),
    {'r_squared_result': [0.8804865768463074], 'mse_result': [37.94773864746094]})
```

### Accessing Weights as a Model Owner in Cape
**`pycape`** uses [`boto`](https://boto3.amazonaws.com/) to access the model weights in your S3 bucket. You'll need to inform pycape about your IAM authentication credentials. Cape expects values for the following AWS configuration keys: `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, and `AWS_REGION`. 

You can set these keys as environment variables in the interpreter running `pycape`:
```shell
    export AWS_ACCESS_KEY_ID=<Access-Key>
    export AWS_SECRET_ACCESS_KEY=<Secret-Key>
    export AWS_REGION=<Region>
```

Alternatively you can simply add these keys to your [AWS Configuration file](https://boto3.amazonaws.com/v1/documentation/api/latest/guide/quickstart.html#configuration).
