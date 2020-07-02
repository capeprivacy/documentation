Module cape_privacy.spark.transformations.rounding
==================================================

Classes
-------

`DateTruncation(frequency: str)`
:   Reduce the precision of a date series

Truncate each date in a series to the unit (year or month)
specified by frequency.

Attributes:
frequency (string): expect to be 'year' or 'month'

### Ancestors (in MRO)

* cape_privacy.spark.transformations.base.Transformation
* cape_privacy.spark.transformations.base.AbstractTransformation

### Class variables

`identifier`
:

`type_signature`
:

`NumericRounding(dtype: pyspark.sql.types.DataType, precision: int)`
:   Reduce the precision of a numeric series

Round each value in the series to the given number
of digits.

Attributes:
dtypes (dtypes.Numerics): series type.
precision (int): set the number of digits.

### Ancestors (in MRO)

* cape_privacy.spark.transformations.base.Transformation
* cape_privacy.spark.transformations.base.AbstractTransformation

### Class variables

`identifier`
:

`type_signature`
: