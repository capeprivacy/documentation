# Manage Projects

You can create, delete, or query for projects in Cape DS. 

## List Projects

```python
    c.list_projects()
```

Default response:

```shell
    PROJECT ID   NAME                LABEL
    -----------  ------------------  ------------------
    project_123  Sales Transactions  sales-transactions
```

## Get Project

```python
    # Get project by ID
    c.get_project(id="project_123")

    # Get project by label
    c.get_project(label="my-project")
```

Default response:

```shell
    Project(id=project_123, name=My Project, label=my-project)
```

## Create a Project

```python
    c.create_project(name="My Project" owner="org_123" description="Linear Regression model with amazorn.")
```

Default response:

```shell
    Project(id=project_123, name=My Project, label=my-project)
```

## Delete a Project

```python
    c.remove_project(id="project_123")
```

Default response:

```shell
    Project (project_123) deleted
```
