# Cape Python API

The Cape Python API allows you to write data privacy policies and data transformations to integrate with [Pandas](https://pandas.pydata.org/) and [Spark](https://spark.apache.org/).

## Prerequisites

* Python 3.6 or above
* Cape Privacy recommends using a virtual environment such as [venv](https://docs.python.org/3/library/venv.html) or [conda](https://www.anaconda.com/products/individual).

## Installation 

[TODO: pending whether it gets published to pip etc.]

## Quickstart

### Write the policy

The data policy file defines the target data and permissions. It is written in YAML. The Cape Python API library reads the `.yaml` policy file and applies the policies based on your [policy application script](#TODO).

Create a `test_policy.yaml` file in your project, with the following content:

```yaml
label: test_policy
spec:
    version: 1
    label: test_policy
    rules:
    # The last part of the target name (in this case, 'transactions') 
    # must match the entity passed to apply_policies() in the next section
    - target: records:transactions.transactions
    action: read
    effect: allow
    transformations:
    # Tells the policy runner to apply the transformation plusN 
    # with the specified arguments
    - field: value
        function: plusN
        args:
            n:
                value: 1
    # Tells the policy runner to apply another plusN transformation
    - field: value
        function: plusN
        args:
            n:
                value: 2
```


### Write the policy application script

To apply the policy `.yaml` to your data, you must run a script that defines which policy you apply to which data target.

Create a `test_transformation.py` file in your project, with the following content:


=== "Pandas"
    ```python
    import pandas as pd
    import numpy as np
    import cape

    df = pd.DataFrame(np.ones(5,), columns=["value"])
    policy = cape.parse_policy("test_policy.yaml")
    df = cape.apply_policies([policy], "transactions", df)

    print(df.head())
    ```

=== "Spark"
    ```python
    ```


### Run your transformations

You can choose where in your workflow to run your transformation scripts. Refer to [Best practices - Running transformations](../best-practices/running-transformations.md) for guidance.