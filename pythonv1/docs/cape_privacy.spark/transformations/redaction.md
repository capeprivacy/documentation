<a name="cape_privacy.spark.transformations.redaction"></a>
# cape\_privacy.spark.transformations.redaction

<a name="cape_privacy.spark.transformations.redaction.ColumnRedact"></a>
## ColumnRedact Objects

```python
class ColumnRedact()
```

Redacts columns from a Spark dataframe.

**Attributes**:

- `columns` - Which columns are redacted.

<a name="cape_privacy.spark.transformations.redaction.RowRedact"></a>
## RowRedact Objects

```python
class RowRedact()
```

Redacts rows satisfying some condition from a Spark DataFrame.

**Attributes**:

- `condition` - When this condition evaluates to True for a row, that row
  will be dropped.

