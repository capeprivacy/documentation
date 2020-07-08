<a name=".cape_privacy.pandas.transformations.rounding"></a>
# cape\_privacy.pandas.transformations.rounding

<a name=".cape_privacy.pandas.transformations.rounding.NumericRounding"></a>
## NumericRounding Objects

```python
class NumericRounding(base.Transformation):
 |  NumericRounding(dtype: dtypes.Numerics, precision: int)
```

Reduce the precision of a numeric Pandas Series

Round each value in the Pandas Series to the given number
of digits.

**Examples**:

  ```
  s = pd.Series([1.384])
  round = NumericRounding(precision=1)
  round(s) # pd.Series([1.4])
  ```
  

**Attributes**:

- `dtypes` _dtypes.Numerics_ - Pandas Series type.
- `precision` _int_ - set the number of digits.

<a name=".cape_privacy.pandas.transformations.rounding.NumericRounding.__call__"></a>
#### \_\_call\_\_

```python
 | __call__(x: pd.Series) -> pd.Series
```

Round each value in the Pandas Series

**Arguments**:

- `x` _A Pandas Series_ - need to be a list of numeric values.
  

**Returns**:

  A Pandas Series with each value rounded

<a name=".cape_privacy.pandas.transformations.rounding.DateTruncation"></a>
## DateTruncation Objects

```python
class DateTruncation(base.Transformation):
 |  DateTruncation(frequency: str)
```

Reduce the precision of a date Pandas Series
Truncate each date in a Pandas Series to the unit (year
or month) specified by frequency.

**Examples**:

  ```
  s = pd.Series([pd.Timestamp("2018-10-15")])
  trunc = DateTruncation(frequency="year")
  trunc(s) # pd.Serie([pd.Timestamp("2018-01-01")])
  ```

**Attributes**:

- `frequency` _string_ - expect to be 'year' or 'month'

