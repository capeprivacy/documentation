# Cape Python API with Coordinator

This is extension of the quickstart guide found [here](./quickstart.md). Please refer to that first before
getting started here.

## Cape Coordinator

The Cape Coordinator is a server application that manages access to policy and projects based on user authentication and a user's roles.

- Stores data in a database for retrieval.
- Exposes GraphQL and HTTP endpoints for managing the coordinator.
- Exposes GraphQL and HTTP endpoints to retieve projects, policies and user information.
- Encrypts secret data (such as Transformation keys and user credentails) before storing them in the database.

cape-python contains an API for connecting to the coordinator and retriveing policies which can then be applied to data.

Please follow the instructions [here](../../cape-core/coordinator.md) to get started installing the Coordinator.

## Quickstart

### Create first project

Once the Coordinator is installed you can begin issuing CLI commands to it.

First, authenticate with the Coordinator by running:

```bash
$ CAPE_PASSWORD=<PASSWORD> cape login --email <EMAIL>
```

Fill in <PASSWORD> and <EMAIL> with the values chosen during Coordinator installation.

Projects are used to manage which version of policy is applied to a dataset. To create a
first project run:

```bash
$ cape projects create first-project "Hello Project World"
```

Once the project is created we can add policy to it from a policy specification.

Copy the following YAML to a file called `first-policy.yaml`. This yaml is very similar to the
yaml that was used during the [Quickstart guide](./quickstart.md).

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

Next, update the project with the first version of policy:

```bash
$ cape projects update --from-spec first-policy.yaml first-project
```

### Get an API token

To be able to connect to the Coordinator from cape-python you need an API token. This can
be obtained by running:

```bash
$ cape tokens create
```

You'll see output like:

```
A token for cape_user@mycape.com has been created!

Token:    201ch0g5y6ufk08g312vjqjfhw,ASFltSt93kEN803HrxNO0sGDWjERl0FsrA

‼ Remember: Please keep the token safe and share it only over secure channels.
```

The token can be copied and then pasted below in the policy application script.

### Write the policy application script

The below script is very similar from the [Quickstart guide](./quickstart.md) except in this
case we're connecting to the Coordinator to retrieve the policy.

Create a `coordinator-policy.py` file in your project, with the following content:

```python
import cape_privacy as cape
import pandas as pd

# In the Coordinator installation instructions you should have ran the
# Coordinator on port 8181. If not, edit the line below with the proper
# port.
client = cape.Client("http://localhost:8181")
client.login("<PASTE TOKEN HERE>")

p_dict = client.get_policy("first-project")
policy = cape.parse_policy(p_dict)

# Create a simple Pandas DataFrame
df = pd.DataFrame([114.432, 134.622, 142.984], columns=["weight"])

df = cape.apply_policy(policy, df, inplace=False)
print(df.head())
```

### Run your transformations

The quickstart example creates a dataset programatically, so you can run the policy application script and view the output:

```bash
$ python coordinator-policy.py
```