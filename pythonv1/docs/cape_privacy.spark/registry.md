<a name="cape_privacy.spark.registry"></a>
# cape\_privacy.spark.registry

<a name="cape_privacy.spark.registry.get"></a>
#### get

```python
get(transformation: str) -> TransformationCtor
```

Returns the constructor for the given key.

**Arguments**:

- `transformation` - The key of transformation to retrieve.

<a name="cape_privacy.spark.registry.register"></a>
#### register

```python
register(label: str, ctor: TransformationCtor)
```

Registers a new transformation constructor under the label provided.

**Arguments**:

- `label` - The label that will be used as the key in the registry
- `ctor` - The transformation constructor

