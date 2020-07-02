Module cape_privacy.spark.transformations.perturbation
======================================================

Classes
-------

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