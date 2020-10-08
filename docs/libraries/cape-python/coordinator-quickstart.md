# Cape Python API with Coordinator

This document describes how to use Cape Python with Cape Coordinator. It builds on the [Cape Python quickstart guide](/libraries/cape-python/quickstart/) and the [Cape Coordinator](/cape-core/coordinator/) installation guides.

## Quickstart

### Prerequisites

* [Cape Coordinator](/cape-core/coordinator/) installed. You need the password and email that you set during Cape Coordinator installation.
* [Cape Python](/libraries/cape-python/quickstart/#installation) installed.

We recommend working through the [Cape Python quickstart guide](/libraries/cape-python/quickstart/) and reading the [Cape Coordinator](/cape-core/coordinator/) documentation before following the steps below.

### Create your first project

Authenticate with Cape Coordinator by running:

```shell
$ CAPE_PASSWORD=<PASSWORD> cape login --email <EMAIL>
```

Replace `<PASSWORD>` and `<EMAIL>` with the values set during Cape Coordinator installation.

Cape Coordinator uses projects to manage which version of a policy is applied to a dataset. To create your first project, run:

```shell
$ cape projects create first-project "Hello Project World"
```

You can now add a policy to the project from a policy specification file.

Copy the following YAML to a file called `first-policy.yaml`:

```yaml
version: 1
rules:
# Set the column name
- match:
    name: weight
  actions:
    - transform:
        # This example shows an unnamed transformation.
        # It tells the policy runner to:
        # (1) Apply the transformation numeric-rounding
        # (2) Round to one decimal place
        type: numeric-rounding
        dtype: Double
        precision: 1
```

Update the project with the first version of policy:

```shell
$ cape projects update --from-spec first-policy.yaml first-project
```

### Get an API token

To connect to Cape Coordinator from Cape Python you need an API token. Obtain the token by running:

```shell
$ cape tokens create
```

You'll see output like:

```shell
A token for cape_user@mycape.com has been created!

Token:    <REDACTED TOKEN>

‼ Remember: Please keep the token safe and share it only over secure channels.
```

Copy the token from the CLI. You will need it in the next section.

### Write the policy application script

The following script is very similar to the [Cape Python quickstart guide](/libraries/cape-python/quickstart/), except in this
case we're connecting to Cape Coordinator to retrieve the policy.

Create a `coordinator-policy.py` file in your project, with the following content:

```python
import cape_privacy as cape
import pandas as pd

# In the Coordinator installation instructions you should have run the
# Coordinator on port 8080. If not, edit the line below with the proper
# port.
client = cape.Client("http://localhost:8080")
client.login("<PASTE TOKEN HERE>")

p_dict = client.get_policy("first-project")
policy = cape.parse_policy(p_dict)

# Create a simple Pandas DataFrame
df = pd.DataFrame([114.432, 134.622, 142.984], columns=["weight"])

df = cape.apply_policy(policy, df, inplace=False)
print(df.head())
```

Make sure to replace `<PASTE TOKEN HERE>` with your API token.

### Run your transformations

In `coordinator-policy.py` we create a dataset programatically, so there are no further steps to load a dataset.

Run the policy application script and view the output:

```bash
$ python coordinator-policy.py
```
