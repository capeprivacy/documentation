# Cape Python API

Cape Python allows you to write data privacy policies and data transformations to integrate with [Pandas](https://pandas.pydata.org/) and [Spark](https://spark.apache.org/).

You can view the source code in the [Cape Python GitHub Repository](https://github.com/capeprivacy/cape-python).

## Prerequisites

* Python 3.6 or above
* Cape Privacy recommends using a virtual environment such as [venv](https://docs.python.org/3/library/venv.html) or [conda](https://www.anaconda.com/products/individual).

## Installation 

```shell
pip install cape-privacy
```

## Quickstart

### Write the policy

The data policy file defines the target data and permissions. It is written in YAML. Cape Python reads the `.yaml` policy file and applies the policies based on your [policy application script](#TODO).

Create a `test_policy.yaml` file in your project, with the following content:

```yaml
policy:
    version: 1
    label: test_policy
    rules:
    - target: groceries
    # Set the column name
    - match: weight
      actions:
        - transform:
            # This example shows an unnamed transformation.
            # It tells the policy runner to:
            # (1) Apply the transformation NumericRounding 
            # (2) Round to one decimal place
            type: NumericRounding
            precision: 1
```


### Write the policy application script

To apply the policy `.yaml` to your data, you must run a script that defines which policy you apply to which data target.

Create a `test_transformation.py` file in your project, with the following content:


=== "Pandas"
    ```python
    import pandas as pd
    import numpy as np
    import cape

    df = pd.DataFrame(np.ones(5,), columns=["fruit"])
    policy = cape.parse_policy("test_policy.yaml")
    df = cape.apply_policies([policy], "fruit", df)

    print(df.head())
    ```

=== "Spark"
    ```python
    [TODO - coming soon]
    ```


### Run your transformations

You can choose where in your workflow to run your transformation scripts. Refer to [Best practices - Running transformations](../../best-practices/running-transformations.md) for guidance.
