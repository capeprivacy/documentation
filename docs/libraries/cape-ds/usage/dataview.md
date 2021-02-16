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

Initialize a `DataView` class and pass the instance to the `add_dataview` method.

```python
    my_project = c.get_project(id="project_123")

    data_view = DataView(name="my-data", uri="s3://my-data.csv", owner_label="my-org")
    my_project.add_dataview(data_view)
```

Default response:

```shell
    DataView(id=dataview_123, name=my-data, location=s3://my-data.csv)
```

By default, Cape attempts to look at your data and create a schema. 

By inspecting the schema property, other data scientists that are added as contributors to the current project are able to identify which data columns should be trained against. 

If you would prefer to specify your data's schema yourself, you can do so using the `schema` parameter. DataViews can be instatiated with a pandas series of type `pd.Series`:

```python
    import pandas as pd
    df = pd.DataFrame(data={'col_1': [1, 2], 'col_2': [3, 4]})

    data_view = DataView(name="my-data", uri="s3://my-data.csv", schema=df.dtypes)
```

DataViews can also be instantiated as a list of data types. Accepted schema data types include: `string`, `integer`, `number`, `datetime`, `any`.

```python
    schema = [{'name': 'col_1', 'schema_type': 'integer'}, {'name': 'col_2', 'schema_type': 'integer'}]

    data_view = DataView(name="my-data", uri="s3://my-data.csv", schema=schema)
```

## Delete a DataView

```python
    my_project = c.get_project(id="project_123")

    my_project.remove_dataview(id="dataview_123")
```

Default response:

```shell
    DataView (dataview_123) deleted
```


