# cape-ds

[![codecov](https://codecov.io/gh/capeprivacy/cape-ds/branch/main/graph/badge.svg?token=nimecXcQzo)](https://codecov.io/gh/capeprivacy/cape-ds)

**cape-ds** is a set of Python modules for interacting with your Cape data. Using cape-ds, you can:

- Create and query [dataviews](/libraries/cape-ds/reference#capedataview), or pointers to the data that you want to use to train a model using Cape's encrypted learning protocol.
- Submit and track [jobs](/libraries/cape-ds/reference#capedataview), which are computational sessions which contain instructions for how to train your model.

## Short Tutorial
Access your Cape projects by creating a instance of the main [`Cape`](/libraries/cape-ds/reference#capecape) class:
``` 
    from cape import Cape

    c = Cape()
    c.login()

    my_projects = c.list_projects()
```

Add dataviews to your project, review dataviews added by other organizations collaborating with you in the project, and submit your job.
```    
    from cape import VerticallyPartitionedLinearRegression

    my_project = c.get_project("project_123")

    my_project.create_dataview(name="my-data", uri="s3://my-data.csv" owner_label="my-org")

    dvs = my_project.list_dataviews()

    vlr_job = VerticallyPartitionedLinearRegression(
        train_dataview_x=dvs[0],
        train_dataview_y=dvs[1]
    )

    my_project.submit_job(vlr_job)
```

## Installation

### Prerequisites

* Python 3.6 or above, and pip
* [Make](https://www.gnu.org/software/make/) (if installing from source)


### Download from source

Install the library from and it's dependencies from git: 

```sh
git clone https://github.com/capeprivacy/cape-ds.git
cd cape-ds
make bootstrap
```

## Licensing

TODO


