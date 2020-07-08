<a name=".cape_privacy.spark.transformations.perturbation"></a>
# cape\_privacy.spark.transformations.perturbation

<a name=".cape_privacy.spark.transformations.perturbation.NumericPerturbation"></a>
## NumericPerturbation Objects

```python
class NumericPerturbation(base.Transformation):
 |  NumericPerturbation(dtype: dtypes.DType, min: (int, float), max: (int, float), seed: Optional[int] = None)
```

Add uniform random noise to a numeric series

Mask a numeric series by adding uniform random noise to each value.
The amount of noise is drawn from the interval [min, max).

**Attributes**:

- `dtype` _dtypes.Numerics_ - series type
- `min` _int, float_ - the values generated will be greater or equal to min
- `max` _int, float_ - the values generated will be less than max
  seed (int), optional: a seed to initialize the random generator

<a name=".cape_privacy.spark.transformations.perturbation.DatePerturbation"></a>
## DatePerturbation Objects

```python
class DatePerturbation(base.Transformation):
 |  DatePerturbation(frequency: StrTuple, min: IntTuple, max: IntTuple)
```

Add uniform random noise to a Pandas series of timestamps

Mask a series by adding uniform random noise to the specified
frequencies of timestamps. The amount of noise for each frequency
is drawn from the internal [min_freq, max_freq).

Note that seeds are currently not supported.

**Attributes**:

- `frequency` _str, str list_ - one or more frequencies to perturbate
- `min` _int, int list_ - the frequency value will be greater or equal to min
- `max` _int, int list_ - the frequency value will be less than max

<a name=".cape_privacy.spark.transformations.perturbation_test"></a>
# cape\_privacy.spark.transformations.perturbation\_test

