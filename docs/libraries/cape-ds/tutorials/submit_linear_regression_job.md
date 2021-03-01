# Train a Linear Regression Model using Cape DataViews & Jobs

This tutorial will walk you through the process of training an encrypted linear regression model in collaboration with another organization using Cape Privacy. You'll learn how to:

- Send datasets securely to Cape Cloud.
- Review the dataset schemas of other organizations in your project.
- Approve and reject model computation jobs.
- View the metrics or weights of the trained model, depending on your role in the project.

We'll use the [Cape UI](https://demo.capeprivacy.com) to setup and review actvity in the project. 

We'll also use the [`cape-ds`](https://github.com/capeprivacy/cape-ds) Python library to create and review pointers to datasets or [`DataViews`](/libraries/cape-ds/reference#capedataview), and create [`Tasks`](/libraries/cape-ds/reference#capetask), Cape Python objects that contain instructions for how to train a model using the data provided, and review [`Jobs`](/libraries/cape-ds/reference#capejob), in order to track the status of the training, and view the results of the trained model.

## Project Setup

### Create an Organization

First you'll need to create an organization at [demo.capeprivacy.com](https://demo.capeprivacy.com).

![](../img/create-org.gif)

Once you've created your organization, you can navigate to _Organization Settings_ and generate a token for your organization. You'll need this token to [configure your worker](/understand/architecture/cape-workers).

![](../img/org-token.gif)

Take note of this value as you cannot recover it after you reload the page.

### Create a Project

Next, create a [`Project`](/libraries/cape-ds/reference#capeproject) within one of the organizations you just created.

`Projects` serve as the context in which you can define and review `Jobs` with other organizations.

![](../img/create-project.gif)

Add organizations to your project in order to begin collaborating with them on training a model.

![](../img/add-org.gif)

### Get a User Token

Finally, we will need a [user token](/understand/features/tokens/) to authenticate against `cape-ds`. Ensure you are
working within your user context and navigate to _Account Settings_ to create a token.

![](../img/user-token.gif)

Take note of this value as, like the user token, you cannot recover it after you reload the page.

That is it for the UI for now! We'll return later to review and approve `DataViews` and `Jobs`. 

Next we will setup `DataViews` and `Jobs` in `cape-ds`.

## Working with the Cape DS Python Library
### Login to Cape DS

Before you can make requests to Cape Cloud, you'll need to authenticate with the API. Follow [these instructions to authenticate](/libraries/cape-ds/usage/login) with our API using `cape-ds`. Once you've logged in successfully, you should see a success message.

```python
	>>> c = Cape()
    >>> c.login()

	Login successful
```

### Add a DataView to your project

Use the `list_projects` method defined on the main `Cape` class, to query a list of projects that belong to your organization.

```python
    >>> my_projects = c.list_projects()

    PROJECT ID   NAME                     LABEL
    -----------  -----------------------  -----------------------
    project_123  Default Risk Assessment  default-risk-assessment

	>>> my_projects

	[Project(id=project_123, name=Default Risk Assessment, label=default-risk-assessment)]
```

To create a [`DataView`](/libraries/cape-ds/reference#capedataview) and add it to your project, simply call the `create_dataview` method defined on the `Project` class.

```python
    >>> my_project = c.get_project(id="project_123")

    >>> my_project.create_dataview(name="my-data", uri="s3://my-data.csv", owner_label="my-org")
```
All `DataViews` must be associated with an organization. This association can be made by passing eiher an `owner_label` or an `owner_id` to the `create_dataview` method.

!!! note
    Use the `organization` attribute on your `Project` class instance to verify the metadata of organizations that are contributing to the project.

!!! note
    Unless your dataset is publically accessible, you'll need to [specify your schema](/libraries/cape-ds/usage/dataview#specifying-a-schema-for-your-dataview).

### Review Your Collaborator's DataView

Before we can submit a job to train our linear regression model, we'll need to review the `DataViews` added to the project by our collaborators.

Use the `list_dataviews` method defined on the `Project` class to inspect the name, owner (organization) and location of `DataViews` added to the project:

```python
    >>> my_project = c.get_project(id="project_123")

    >>> dataviews = my_project.list_dataviews()

    DATAVIEW ID  NAME          LOCATION         OWNER
    -----------  ------------  ---------------  -------------
    01EY48       orgacle-data  s3://mydata.csv  orgacle (You)
    01EY49       atlas-data                     atlas 
```

!!! note
    You'll only be able to see the locations or URIs of datasets that belong to your organization.

You can also inspect the schema of each dataview in your project in order to see the data types of the columns, and to assess which data columns should be used to train the linear regression model.

```python
    >>> dataviews[1].schema
    {
        'debt equity ratio': 'number',
        'operating margin': 'number',
        'working capital': 'integer'
    }
```

You can also review the dataviews added to your project in the UI.

![](../img/add-dataview.gif)

### Submitting a Linear Regression Job

Now that we've added our own `DataView` to the project, and vetted the `DataView` of our collaborator, we are ready to submit our Cape linear regression job.

Pass the `DataView` that contains training data to `x_train_dataview`, and the `DataView` that contains the target values to `y_train_dataview`.

```python
    >>> dataview_1 = my_project.get_dataview(id="01EY48")
    >>> dataview_2 = my_project.get_dataview(id="01EY49")

    >>> vlr = VerticallyPartitionedLinearRegression(
    >>>     x_train_dataview=dataview_1,
    >>>     y_train_dataview=dataview_2,
    >>> )

    >>> my_project.submit_job(job=vlr)
```

You can also specify which data columns the model should be trained on or evaluated against by passing the dataview to the [`VerticallyPartitionedLinearRegression`](/libraries/cape-ds/reference#capeverticallypartitionedlinearregression) class like so:

```python
    >>> VerticallyPartitionedLinearRegression(
    >>>     x_train_dataview=dataview_1["debt equity ratio"],
    >>>     y_train_dataview=dataview_2["debt equity ratio"],
    >>> )

    VerticallyPartitionedLinearRegression(x_train_dataview=Orgacle Dataview['debt equity ratio'], y_train_dataview=Atlas Dataview['debt equity ratio'])
```

!!!note
    In order for your linear regression job to train a model using Cape's encrypted learning protocol, you'll need to run your own Cape workers. Read [our documentation to get set up with Cape workers](/understand/architecture/cape-workers).

### Tracking Job Status

After submitting your job, you should be able to see the status and details of your `Job` in the UI.

![](../img/job-details.gif)

To check the status of your submitted linear regression job using Cape DS, use the [`get_status`](/reference/#cape.api.job.job.Job.get_status) method:
```python
    >>> lr_job = my_project.get_job(id="abc_123")

    >>> lr_job.get_status()
    Success
```

### Approving Jobs

Before Cape can begin to train a linear regression model using the datasets submitted via `submit_job` method, both parties need to review and approve the Job.

To approve, you'll need to head over to the UI and navigate to your Job's details page. Once you've reviewed the details of your Job are correct, you can click "Approve Job" to let Cape know the job looks good on your end.

![](../img/approve-job.gif)

!!!note
    Before your job can run, both parties need to approve it.

### Getting Weights and Metrics from Trained Model

Once your job has successfully completed, you can view the results of the trained model. 

Whether you can view the weights or metrics of the trained model (or both!) depends on the role you and your organization play in the project.

To view the weights and metrics of a job, use the [`get_results`](/reference/#cape.api.job.job.Job.get_results) method:

```python
    >>> lr_job = my_project.get_job(id="abc_123")

    >>> weights, metrics = lr_job.get_results()

    >>> weights
    array([12.14955139,  1.96560669])

    >>> metrics
    {'r_squared_result': [0.8804865768463074], 'mse_result': [37.94773864746094]}
```

If you are the model owner, the first value in the returned tuple will be populated with a numpy array of weights from your trained model.

!!!note
    To access model weights you'll need to [inform **cape-ds** about your AWS IAM authentication credentials](libraries/cape-ds/usage/job/#accessing-weights-as-a-model-owner-in-cape).
