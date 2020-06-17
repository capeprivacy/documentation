<a name=".run_codegen"></a>
# run\_codegen

<a name=".cape"></a>
# cape

<a name=".cape.auth"></a>
# cape.auth

<a name=".cape.auth.api_token"></a>
# cape.auth.api\_token

<a name=".cape.auth.api_token.APIToken"></a>
## APIToken Objects

```python
class APIToken():
 |  APIToken(token: str)
```

Represents an API token used to authenticate with the coordinator.

The format is: <token_id>,<base64 string>

The first byte of the decoded base64 string is the version and the rest
is the secret.

**Attributes**:

- `token_id` - The id of the token.
- `version` - The version of the token format.
- `secret` - The password used to authenticate.
- `raw` - The raw token string.

<a name=".cape.auth.api_token.create_api_token"></a>
#### create\_api\_token

```python
create_api_token(token_id: str, secret: bytes) -> APIToken
```

Creates an APIToken. Mostly used for testing.

**Arguments**:

- `token_id` - The token id to use.
- `secret` - The password to use.
  

**Returns**:

  The constructed APIToken.

<a name=".cape.auth.test_api_token"></a>
# cape.auth.test\_api\_token

<a name=".cape.coordinator"></a>
# cape.coordinator

<a name=".cape.coordinator.client"></a>
# cape.coordinator.client

<a name=".cape.coordinator.client.GraphQLError"></a>
## GraphQLError Objects

```python
class GraphQLError():
 |  GraphQLError(error)
```

Represents a graphql error that can be returned by a coordinator.

**Attributes**:

- `message` - The error message.
- `extensions` - Any extra information returned by coordinator.

<a name=".cape.coordinator.client.GraphQLException"></a>
## GraphQLException Objects

```python
class GraphQLException(Exception):
 |  GraphQLException(errors)
```

Exception wrapping a list of GraphQL errors.

**Attributes**:

- `errors` - List of GraphQL errors.

<a name=".cape.coordinator.client.Client"></a>
## Client Objects

```python
class Client():
 |  Client(host: str)
```

Coordinator client for making GraphQL requests.

Implements a simple GraphQL protocol to communicate with a
coordinator.

**Attributes**:

- `host` - The address of the coordinator.
- `token` - The token used to authenticate with a coordinator.

<a name=".cape.coordinator.client.Client.graphql_request"></a>
#### graphql\_request

```python
 | graphql_request(query: str, variables: Dict[str, str])
```

Makes a GraphQL request to a coordinator.

Adds an authorization header if it exists.

**Arguments**:

- `query` - The GraphQL query to be passed to a coordinator.
- `variables` - The variables to be passed to a coordinator.
  

**Returns**:

  The coordinator's GraphQL data response.
  

**Raises**:

- `GraphQLException` - If a GraphQL error occurs.

<a name=".cape.coordinator.client.Client.service_id_from_source"></a>
#### service\_id\_from\_source

```python
 | service_id_from_source(label: str)
```

Gets the services from the given source label.

<a name=".cape.coordinator.client.Client.service_endpoint"></a>
#### service\_endpoint

```python
 | service_endpoint(id)
```

Gets the service endpoint for the given id

<a name=".cape.coordinator.client.Client.login"></a>
#### login

```python
 | login(token: str)
```

Logs in with the given token string

<a name=".cape.coordinator.client.Client.identity_policies"></a>
#### identity\_policies

```python
 | identity_policies(id: str) -> [Dict[Any, Any]]
```

Returns all policies for the given identity id.

<a name=".cape.coordinator.client.Client.me"></a>
#### me

```python
 | me() -> str
```

Returns the id of the authenticated identity.

<a name=".cape.coordinator.client.Client.query_policies"></a>
#### query\_policies

```python
 | query_policies() -> [Dict[Any, Any]]
```

Queries all of the policies for the authenticated identity.

<a name=".cape.coordinator.client_test"></a>
# cape.coordinator.client\_test

<a name=".cape.polic"></a>
# cape.polic

<a name=".cape.polic.data"></a>
# cape.polic.data

Contains the policy classes that are initialized from a yaml policy file.

There are five main classes with Policy being the top level class. Policy contains
the PolicySpec and NamedTransformations. PolicySpec contains Rules and Rules
contain Transformations.

    Typical usage example:

    yaml_str = "...."
    d = yaml.load(yaml_str, Loader=yaml.FullLoad)

    # **d unpacks the dictionary produced by yaml and
    # passes them in has keyword arguments.
    policy = Policy(**d)

<a name=".cape.polic.data.Policy"></a>
## Policy Objects

```python
class Policy():
 |  Policy(label, spec=None, transformations=[])
```

Top level policy object.

The top level policy object holds the policy label, policy spec
and any named transformations.

**Attributes**:

- `label` - The label of the policy.
- `spec` - The policy spec.
- `transformations` - The named transformations for this policy.

<a name=".cape.polic.data.PolicySpec"></a>
## PolicySpec Objects

```python
class PolicySpec():
 |  PolicySpec(label, version=1, rules=[])
```

Policy spec contains a list of rules.

**Attributes**:

- `label` - The label of the policy spec. Often the same as the policy.
- `rules` - A list of rules.

<a name=".cape.polic.data.Rule"></a>
## Rule Objects

```python
class Rule():
 |  Rule(target, effect="allow", action="read", where=None, transformations=[])
```

A rule contains actionable information of a policy.

**Attributes**:

- `target` - The name of what this rule targets.
- `effect` - What effect the rule has. Currently only allow is supported.
- `action` - Which action the rule allows. Currently only read is supported.
- `where` - The clause that will redact rows if it
  evaluates to true (e.g. value == 10).
- `transformations` - A list of transformations that will be applied.

<a name=".cape.polic.data.NamedTransform"></a>
## NamedTransform Objects

```python
class NamedTransform():
 |  NamedTransform(name, type, args={})
```

A named transformation that captures the args.

**Attributes**:

- `name` - The name of the named transformation.
- `type` - The builtin type (i.e. transform) that the named transform initializes to.
- `args` - The args that are captured by the named transform.

<a name=".cape.polic.data.Transform"></a>
## Transform Objects

```python
class Transform():
 |  Transform(field, named=None, function=None, where=None, args={})
```

A actual transform that will be applied.

Either named or function must be passed in here. The process to apply this
transform will look at both function and named and apply the relevant one.

**Attributes**:

- `field` - The field this transform will be applied to.
- `named` - The name of the named transform, referenced from
  the top level policy object.
- `function` - The builtin transform that will be initialized.
- `where` - The clause that will apply this transform to the specified
  field if evaluated to true.
- `args` - The args that will be passed into the function if specified.

<a name=".cape.polic.data_test"></a>
# cape.polic.data\_test

<a name=".cape.polic.exceptions"></a>
# cape.polic.exceptions

<a name=".cape.polic.polic"></a>
# cape.polic.polic

Utils for parsing policy and applying them.

The module reads in policy as yaml and then through apply_policies
and applies them to pandas dataframes.

    Typical usage example:

    Example policy yaml:

    label: test_policy
    spec:
      version: 1
      label: test_policy
      rules:
        # The last transactions should match the entity
        # passed below.
        - target: records:transactions.transactions
          action: read
          effect: allow
          transformations:
            # Tells the policy runner to apply the transformation
            # plusN with the specified args.
            - field: value
              function: plusN
              args:
                n:
                  value: 1
            # Tells the policy runner to apply another plusN
            # transformation.
            - field: value
              function: plusN
              args:
                n:
                  value: 2

    Applying policy:

    policy = parse_policy("policy.yaml")

    entity = "transactions"

    df = pd.DataFrame(np.ones(5,), columns=["value"])

    df = apply_policies([policy], entity, df)

<a name=".cape.polic.polic.get_transformation"></a>
#### get\_transformation

```python
get_transformation(policy: Policy, transform: Transform)
```

Looks up the correct transform class.

If the transform is anonymous (i.e. unnamed) then it looks it up from the
transform registry. If it is a named transform it used load_named_transform
to find it.

**Arguments**:

- `policy` - The top level policy.
- `transform` - The specific transform to be applied.
  

**Returns**:

  The initialize transform object.
  

**Raises**:

- `TransformNotFound` - The builtin transform cannot be found.
- `NamedTransformNotFound` - The named transform cannot be found on the
  top level policy object.
- `KeyError` - If neither a function or named transform exists on the transform arg.

<a name=".cape.polic.polic.do_transformations"></a>
#### do\_transformations

```python
do_transformations(policy: Policy, rule: Rule, df)
```

Applies a specific rule's transformations to a pandas dataframe.

For each transform, lookup the required transform class and then apply it
to the correct column in that dataframe.

**Arguments**:

- `policy` - The top level policy.
- `rule` - The specific rule to apply.
- `df` - A pandas dataframe.
  

**Returns**:

  The resulting transformed pandas dataframe.

<a name=".cape.polic.polic.apply_policies"></a>
#### apply\_policies

```python
apply_policies(policies: [Policy], entity: str, df)
```

Applies a list of policies to a pandas dataframe.

For each rule in each policy, if there is a target matching the
entity label passed in then each transform in that rule is applied to
the dataframe. If there is a where clause in the rule then each column
that matches the where is redacted from the final dataframe.

**Arguments**:

- `policies` - List of policy objects to apply
- `entity` - The entity label of the dataframe
- `df` - A pandas dataframe
  

**Returns**:

  The resulting transformed pandas dataframe.

<a name=".cape.polic.polic.parse_policy"></a>
#### parse\_policy

```python
parse_policy(p: str)
```

Parses a policy yaml file.

The passed in string can either be a path to a local file or
a URL pointing to a file. If it is a URL then requests attempts to download it.

**Arguments**:

- `p` - a path string or a URL string
  

**Returns**:

  The Policy object initialized by the yaml.

<a name=".cape.polic.polic.load_named_transform"></a>
#### load\_named\_transform

```python
load_named_transform(policy: Dict[Any, Any], transformLabel: str, field: str)
```

Attempts to load a named transform from the top level policy.

Looks at the top level policy object for the named transform given as transformLabel
and initializes it from the args pulled from the policy object.

**Arguments**:

- `policy` - Top level policy object.
- `transformLabel` - The name of the named transform.
- `field` - The field to which the transform will be applied.
  

**Returns**:

  The initialized transform object.
  

**Raises**:

- `NamedTransformNotFound` - The named transform cannot be
  found in the top level policy object.

<a name=".cape.polic.policy_test"></a>
# cape.polic.policy\_test

<a name=".cape.polic.utils"></a>
# cape.polic.utils

<a name=".cape.polic.utils_test"></a>
# cape.polic.utils\_test

<a name=".cape.transformations"></a>
# cape.transformations

<a name=".cape.transformations.plus_n"></a>
# cape.transformations.plus\_n

<a name=".cape.transformations.plus_n.PlusN"></a>
## PlusN Objects

```python
class PlusN():
 |  PlusN(field: str, n: int = 1) -> None
```

A sample transform that adds n to a specific field.

**Attributes**:

- `field` - The field that this transform will be applied to.
- `n` - The value to add to the field.

<a name=".cape.transformations.plus_n_test"></a>
# cape.transformations.plus\_n\_test

<a name=".cape.transformations.transformations"></a>
# cape.transformations.transformations

<a name=".cape.transformations.transformations.get"></a>
#### get

```python
get(transformation: str) -> TransformationCtor
```

Returns the constructor for the given key.

**Arguments**:

- `transformation` - The key of transformation to retrieve.

<a name=".cape.transformations.transformations.register"></a>
#### register

```python
register(label: str, ctor: TransformationCtor)
```

Registers a new transformation constructor under the label provided.

**Arguments**:

- `label` - The label that will be used as the key in the registry
- `ctor` - The transformation constructor

<a name=".cape.transformations.transformations_test"></a>
# cape.transformations.transformations\_test

<a name=".cape.utils"></a>
# cape.utils

<a name=".cape.utils.base64"></a>
# cape.utils.base64

<a name=".cape.utils.test_base64"></a>
# cape.utils.test\_base64

