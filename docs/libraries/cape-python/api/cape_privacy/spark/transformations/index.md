Module cape_privacy.spark.transformations
=========================================

Sub-modules
-----------
* cape_privacy.spark.transformations.base
* cape_privacy.spark.transformations.perturbation
* cape_privacy.spark.transformations.perturbation_test
* cape_privacy.spark.transformations.redaction
* cape_privacy.spark.transformations.redaction_test
* cape_privacy.spark.transformations.rounding
* cape_privacy.spark.transformations.rounding_test
* cape_privacy.spark.transformations.tokenizer
* cape_privacy.spark.transformations.tokenizer_test

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

`DatePerturbation(frequency: Union[str, Tuple[str, ...]], min: Union[int, Tuple[int, ...]], max: Union[int, Tuple[int, ...]])`
:   Add uniform random noise to a Pandas series of timestamps

Mask a series by adding uniform random noise to the specified
frequencies of timestamps. The amount of noise for each frequency
is drawn from the internal [min_freq, max_freq).

Note that seeds are currently not supported.

Attributes:
frequency (str, str list): one or more frequencies to perturbate
min (int, int list): the frequency value will be greater or equal to min
max (int, int list): the frequency value will be less than max

### Ancestors (in MRO)

* cape_privacy.spark.transformations.base.Transformation
* cape_privacy.spark.transformations.base.AbstractTransformation

### Class variables

`identifier`
:

`type_signature`
:

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

`NumericPerturbation(dtype: pyspark.sql.types.DataType, min: (<class 'int'>, <class 'float'>), max: (<class 'int'>, <class 'float'>), seed: Union[int, NoneType] = None)`
:   Add uniform random noise to a numeric series

Mask a numeric series by adding uniform random noise to each value.
The amount of noise is drawn from the interval [min, max).

Attributes:
dtype (dtypes.Numerics): series type
min (int, float): the values generated will be greater or equal to min
max (int, float): the values generated will be less than max
seed (int), optional: a seed to initialize the random generator

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

`Tokenizer(max_token_len=None, key=None)`
:   Tokenizer: map a string to a token to obfuscate it.

When applying the tokenizer to a Spark series of type string,
each value gets mapped to a token (hexadecimal string).
If a value is repeated several times across the series, it always
get mapped to the same token in order to maintain the count.
A value can be mapped to different tokens by setting the key to a
different value.

Attributes:
max_token_len (int or bytes): control the token length (default
length is 64)
key: expect a string or byte string. if not specified, key will
be set to a random byte string.

### Ancestors (in MRO)

* cape_privacy.spark.transformations.base.Transformation
* cape_privacy.spark.transformations.base.AbstractTransformation

### Class variables

`identifier`
:

`type_signature`
:

### Instance variables

`key`
: