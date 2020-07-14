<a name="cape_privacy.policy.data"></a>
# cape\_privacy.policy.data

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

<a name="cape_privacy.policy.data.Transform"></a>
## Transform Objects

```python
class Transform()
```

A actual transform that will be applied.

Either named or function must be passed in here. The process to apply this
transform will look at both function and named and apply the relevant one.

**Attributes**:

- `field` - The field this transform will be applied to.
- `name` - The name of the named transform, referenced from
  the top level policy object.
- `type` - The builtin transform that will be initialized.
- `kwargs` - The rest of the arguments that will be passed to the transformation.

<a name="cape_privacy.policy.data.Rule"></a>
## Rule Objects

```python
class Rule()
```

A rule contains actionable information of a policy.

**Attributes**:

- `match` - The match used to select a field to be transformed.
- `actions` - The actions to take on a matched field.

<a name="cape_privacy.policy.data.NamedTransform"></a>
## NamedTransform Objects

```python
class NamedTransform()
```

A named transformation that captures the args.

**Attributes**:

- `name` - The name of the named transformation.
- `type` - The builtin type (i.e. transform) that the named transform initializes to.
- `kwargs` - The args that are captured by the named transform.

<a name="cape_privacy.policy.data.Policy"></a>
## Policy Objects

```python
class Policy()
```

Top level policy object.

The top level policy object holds the all of the relevant information
for applying policy to data.

**Attributes**:

- `label` - The label of the policy.
- `version` - The version of the policy.
- `rules` - List of rules that will be applied to a data frame.
- `transformations` - The named transformations for this policy.

