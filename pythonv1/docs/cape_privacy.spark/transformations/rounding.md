<a name="cape_privacy.spark.transformations.rounding"></a>
# cape\_privacy.spark.transformations.rounding

<a name="cape_privacy.spark.transformations.rounding.NumericRounding"></a>
## NumericRounding Objects

```python
class NumericRounding(base.Transformation)
```

Reduce the precision of a numeric series

Round each value in the series to the given number
of digits.

**Attributes**:

- `dtypes` _dtypes.Numerics_ - series type.
- `precision` _int_ - set the number of digits.

<a name="cape_privacy.spark.transformations.rounding.DateTruncation"></a>
## DateTruncation Objects

```python
class DateTruncation(base.Transformation)
```

Reduce the precision of a date series

Truncate each date in a series to the unit (year or month)
specified by frequency.

**Attributes**:

- `frequency` _string_ - expect to be 'year' or 'month'

