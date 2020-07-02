Module cape_privacy.spark.transformations.redaction
===================================================

Classes
-------

`ColumnRedact(columns: List[str])`
:   Redacts columns from a Spark dataframe.

Attributes:
columns: Which columns are redacted.

### Class variables

`identifier`
:

`type_signature`
:

`RowRedact(condition: str)`
:   Redacts rows satisfying some condition from a Spark DataFrame.

Attributes:
condition: When this condition evaluates to True for a row, that row
will be dropped.

### Class variables

`identifier`
:

`type_signature`
: