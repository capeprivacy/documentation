<a name="cape_privacy.pandas.registry"></a>
# cape\_privacy.pandas.registry

<a name="cape_privacy.pandas.registry.get"></a>
#### get

```python
get(transformation: str) -> TransformationCtor
```

Returns the constructor for the given key.

**Arguments**:

- `transformation` - The key of transformation to retrieve.

<a name="cape_privacy.pandas.registry.register"></a>
#### register

```python
register(label: str, ctor: TransformationCtor)
```

Registers a new transformation constructor under the label provided.

**Arguments**:

- `label` - The label that will be used as the key in the registry
- `ctor` - The transformation constructor

