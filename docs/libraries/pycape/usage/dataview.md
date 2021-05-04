# Managing DataViews

## Get list of data views for a project

```python
    my_project = c.get_project(id="project_123")

    my_project.list_dataviews()
```

Default response:

```shell
    DATAVIEW ID                 NAME           LOCATION         OWNER
    --------------------------  -------------  ---------------  -----------
    01EY48EFT4H7PWAN45SG2AEZ81  armazorn-data  s3://mydata.csv  armazorn (You)
    01EY49J86722ENT9JSMKTE65EX  gorgle-data                     gorgle 
```

## Get a data view

```python
    my_project = c.get_project(id="project_123")

    # get by id
    my_project.get_dataview(id="dataview_123")

    # get by uri
    my_project.get_dataview(uri="s3://my-data.csv")
```

Default response:

```shell
    DataView(id=dataview_123, name=my-data, location=s3://my-data.csv)
```

## Add a data view to a project

Initialize a `DataView` class and pass the instance to the `create_dataview` method.

```python
    my_project = c.get_project(id="project_123")

    my_project.create_dataview(name="my-data", uri="s3://my-data.csv", owner_label="my-org")
```

Default response:

```shell
DataView(id=dataview_123, name=my-data, location=s3://my-data.csv)
```

## DataViews and Schemas

`DataView` schemas allow you to clarify the data types of your dataset. They will be visible for other project contributors - even ones from other organizations - to your project to query and inspect. By inspecting the schema property, other project contributors are able to identify which data columns should be used to train the model. 

If you provide a dataset to Cape that is accessible via HTTP or S3, Cape will download your data's column headers and create a schema. 

### Providing S3 read access to your DataView
In order to make your dataset accessible in S3 you'll need to inform pycape about your S3 bucket's IAM authentication credentials. 

Cape expects values for the following AWS configuration keys: `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, and `AWS_REGION`. 

You can set these keys as environment variables in the interpreter running `pycape`:
```shell
export AWS_ACCESS_KEY_ID=<Access-Key>
export AWS_SECRET_ACCESS_KEY=<Secret-Key>
export AWS_REGION=<Region>
```

Alternatively you can simply add these keys to your [AWS Configuration file](https://boto3.amazonaws.com/v1/documentation/api/latest/guide/quickstart.html#configuration).

### Specifying a Schema for your DataView

However, if your dataset is not accessible you'll have to specify your data's schema yourself. You can do so using the `schema` parameter. DataViews can be instantiated with a [pandas](https://pandas.pydata.org/pandas-docs/stable/index.html) Series schema of type [`dataframe.dtypes`](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.dtypes.html):

```python
>>> import pandas as pd
>>> df = pd.DataFrame(data={"col_1": [1, 2], "col_2": [3, 4]})

>>> dataview = my_project.create_dataview(name="my-data", uri="s3://my-data.csv", owner_label="my-org", schema=df.dtypes)

>>> dataview.schema
{'col_1': 'integer', 'col_2': 'integer'}
```

DataViews can also be instantiated as a list of data types. Accepted schema data types include: `string`, `integer`, `number`, `datetime`, and `any`.

```python
>>> schema = [{"name": "col_1", "schema_type": "integer"}, {"name": "col_2", "schema_type": "integer"}]

>>> data_view = DataView(name="my-data", uri="s3://my-data.csv", schema=schema)

>>> dataview.schema
{'col_1': 'integer', 'col_2': 'integer'}
```

## Delete a DataView

```python
my_project = c.get_project(id="project_123")

my_project.delete_dataview(id="dataview_123")
```

Default response:

```shell
DataView (dataview_123) deleted
```


