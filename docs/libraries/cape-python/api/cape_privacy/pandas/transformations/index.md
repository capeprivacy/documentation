Module cape_privacy.pandas.transformations
==========================================

Sub-modules
-----------
* cape_privacy.pandas.transformations.base
* cape_privacy.pandas.transformations.column_redact
* cape_privacy.pandas.transformations.column_redact_test
* cape_privacy.pandas.transformations.perturbation
* cape_privacy.pandas.transformations.perturbation_test
* cape_privacy.pandas.transformations.rounding
* cape_privacy.pandas.transformations.rounding_test
* cape_privacy.pandas.transformations.row_redact
* cape_privacy.pandas.transformations.row_redact_test
* cape_privacy.pandas.transformations.test_utils
* cape_privacy.pandas.transformations.tokenizer
* cape_privacy.pandas.transformations.tokenizer_test

Classes
-------

`ColumnRedact(columns: List[str])`
:   Redacts columns.

Attributes:
columns: The columns to redact.

### Class variables

`identifier`
:

`type_signature`
:

`DatePerturbation(frequency: Union[str, Tuple[str, ...]], min: Union[int, Tuple[int, ...]], max: Union[int, Tuple[int, ...]], seed: Union[int, NoneType] = None)`
:   Add uniform random noise to a Pandas series of timestamps

Mask a Pandas series by adding uniform random noise to the
specified frequencies of timestamps. The amount of noise for
each frequency is drawn from the internal [min_freq, max_freq).

Example:
```
s = pd.Series([datetime.date(year=2020, month=2, day=15)])
perturb = DatePerturbation(frequency="MONTH", min=-10, max=10, seed=1234)
perturb(s) # pd.Series([datetime.date(year=2020, month=11, day=11)])
```

Attributes:
frequency (str, str list): one or more frequencies to perturbate
min (int, int list): the frequency value will be greater or equal to min
max (int, int list): the frequency value will be less than max
seed (int), optional: a seed to initialize the random generator

### Ancestors (in MRO)

* cape_privacy.pandas.transformations.base.Transformation
* cape_privacy.pandas.transformations.base.AbstractTransformation

### Class variables

`identifier`
:

`type_signature`
:

`DateTruncation(frequency: str)`
:   Reduce the precision of a date Pandas Series
Truncate each date in a Pandas Series to the unit (year
or month) specified by frequency.
Example:
```
s = pd.Series([pd.Timestamp("2018-10-15")])
trunc = DateTruncation(frequency="year")
trunc(s) # pd.Serie([pd.Timestamp("2018-01-01")])
```
Attributes:
frequency (string): expect to be 'year' or 'month'

### Ancestors (in MRO)

* cape_privacy.pandas.transformations.base.Transformation
* cape_privacy.pandas.transformations.base.AbstractTransformation

### Class variables

`identifier`
:

`type_signature`
:

`NumericPerturbation(dtype: (dtype('float32'), dtype('float64'), dtype('int8'), dtype('int16'), dtype('int32'), dtype('int64')), min: Union[int, float], max: Union[int, float], seed: Union[int, NoneType] = None)`
:   Add uniform random noise to a numeric Pandas series

Mask a numeric Pandas series by adding uniform random
noise to each value. The amount of noise is drawn from
the interval [min, max).

Example:
```
s = pd.Series([0, 1, 2, 3, 4])
perturb = NumericPerturbation(dtype=Integer, min=-10, max=10, seed=123)
perturb(s) # pd.Series([3, -7, -3, -3])
```

Attributes:
dtype (dtypes.Numerics): Pandas Series type
min (int, float): the values generated will be greater then or equal to min
max (int, float): the values generated will be less than max
seed (int), optional: a seed to initialize the random generator

### Ancestors (in MRO)

* cape_privacy.pandas.transformations.base.Transformation
* cape_privacy.pandas.transformations.base.AbstractTransformation

### Class variables

`identifier`
:

`type_signature`
:

`NumericRounding(dtype: (dtype('float32'), dtype('float64'), dtype('int8'), dtype('int16'), dtype('int32'), dtype('int64')), precision: int)`
:   Reduce the precision of a numeric Pandas Series

Round each value in the Pandas Series to the given number
of digits.

Example:
```
s = pd.Series([1.384])
round = NumericRounding(precision=1)
round(s) # pd.Series([1.4])
```

Attributes:
dtypes (dtypes.Numerics): Pandas Series type.
precision (int): set the number of digits.

### Ancestors (in MRO)

* cape_privacy.pandas.transformations.base.Transformation
* cape_privacy.pandas.transformations.base.AbstractTransformation

### Class variables

`identifier`
:

`type_signature`
:

### Methods

`round_numeric(self, x: pandas.core.series.Series)`
:

`RowRedact(condition: str)`
:   Redacts rows based on the condition.

Attributes:
condition: The condition to be passed into the query function.

### Class variables

`identifier`
:

`type_signature`
:

`Tokenizer(max_token_len: int = None, key: str = None)`
:   Tokenizer: map a string to a token to obfuscate it.

When applying the Tokenizer to a Pandas Series of type string,
each value gets mapped to a token (hexadecimal string).
If a value is repeated several times across the series, it always
get mapped to the same token in order to maintain the count.
A value can be mapped to different tokens by setting the key to a
different value.

Example:
```
s = pd.Series(['A'])
tokenize = Tokenizer(max_token_len=5, key='secret')
tokenize(s) # pd.Series(['40a1e'])
```

Attributes:
max_token_len (int or bytes): control the token length (default
length is 64)
key: expect a string or byte string. if not specified, key will
be set to a random byte string.

### Ancestors (in MRO)

* cape_privacy.pandas.transformations.base.Transformation
* cape_privacy.pandas.transformations.base.AbstractTransformation

### Class variables

`identifier`
:

`type_signature`
:

### Instance variables

`key`
:

### Methods

`to_token(self, x)`
: