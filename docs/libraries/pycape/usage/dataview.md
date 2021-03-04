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

### Specifying a Schema for your DataView

`DataView` schemas allow you to clarify the data types of your dataset. They will be visible for other project contributors - even ones from other organizations - to your project to query and inspect. By inspecting the schema property, other project contributors are able to identify which data columns should be used to train the model. 

If you provide a dataset to Cape that is publicly accessible via HTTP, Cape will attempt to preview your data and create a schema. 

However, if your dataset is not publicly accessible you'll have to specify your data's schema yourself. You can do so using the `schema` parameter. DataViews can be instantiated with a [pandas](https://pandas.pydata.org/pandas-docs/stable/index.html) Series schema of type [`dataframe.dftypes`](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.dtypes.html):

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


