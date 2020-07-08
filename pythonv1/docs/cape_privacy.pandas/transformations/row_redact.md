<a name=".cape_privacy.pandas.transformations.row_redact"></a>
# cape\_privacy.pandas.transformations.row\_redact

<a name=".cape_privacy.pandas.transformations.row_redact.RowRedact"></a>
## RowRedact Objects

```python
class RowRedact():
 |  RowRedact(condition: str) -> None
```

Redacts rows based on the condition.

**Attributes**:

- `condition` - The condition to be passed into the query function.

<a name=".cape_privacy.pandas.transformations.row_redact.RowRedact.__call__"></a>
#### \_\_call\_\_

```python
 | __call__(df: pd.DataFrame) -> pd.DataFrame
```

Redacts rows using Dataframe.query.

DataFrame.query returns all the fields that it matches so
we negate it here to get the opposite.

