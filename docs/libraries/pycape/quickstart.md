# Getting Started with PyCape

This guide provides an example of using pycape to run encrypted learning on Cape Cloud.

## Prerequisites

* Python 3.6 or above.
* Cape Privacy recommends using a virtual environment such as [venv](https://docs.python.org/3/library/venv.html).


## Installation

You can install Cape Python with pip:

```shell
pip install pycape
```

## Quickstart

### Register on Cape Cloud, Create an Organization and a Project

To get started using Cape, you will need to register on Cape Cloud. Once registered, you can create an organization (or join one you were invited to) and create your first project.

Once your project is set up, you will want to generate an [Organizational Token](/understand/features/tokens/) and a [user token](/understand/features/tokens/). These are managed on your organizational settings and user settings pages. 

!!!note
    Depending on your [role and permissions](/understand/features/roles/) in the organization, you may not be able to create and use organizational tokens. If someone else is an operator or an organizational administrator, they can create and use these tokens.


### Deploy a Cape Worker

If you are working alongside an operator, ensure they set up the Cape worker able to reach the Cape Cloud and the Amazon S3 bucket you would like to use. They will also need the organizational token to identify the worker to the Cape Cloud service. More information can be found in the [Cape Worker documentation](/understand/architecture/cape-workers).

### Prepare and Add Data to Storage

Once the Cape worker is deployed, you'll want to add any files you plan on using for your project to the Amazon S3 bucket storage or another persistent storage that the worker can access. You will want to coordinate on indeces and aggregation with the other organization to ensure they line up when encrypted learning jobs are running. For more tips, please see our [Linear Regression best practices](/understand/best-practices/linear-regression/).

### Login and Register Your Data Views

First, you'll need to login to Cape by following [the library's login method and variables](/libraries/pycape/usage/login). Once you are logged in, you can register data views using a few short commands.

```python
# List projects
my_projects = c.list_projects()

# Register a Data View
my_project = c.get_project(id="project_123")
my_project.create_dataview(name="my-data", uri="s3://my-data.csv", owner_label="my-org")
```

### Run Your First Encrypted Learning Job

To create and run your first encrypted learning job, you'll use the `pycape` library. 

```python
# List all data views
my_project.list_dataviews()

# Select the ones you want to use
dataview_1 = my_project.get_dataview(id="01EY48")
dataview_2 = my_project.get_dataview(id="01EY49")

# Create a linear regression job
vlr = VerticallyPartitionedLinearRegression(
     x_train_dataview=dataview_1,
     y_train_dataview=dataview_2,
     model_location="s3://my-bucket",
)

# Submit a job 
lr_job = my_project.submit_job(job=vlr)

# Check job status and pull results
lr_job.get_status()
weights, metrics = lr_job.get_results()
```

For a more detailed walkthrough, please review our [Linear Regression tutorial](/libraries/pycape/tutorials/submit_linear_regression_job/).
