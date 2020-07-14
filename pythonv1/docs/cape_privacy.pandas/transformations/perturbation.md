<a name="cape_privacy.pandas.transformations.perturbation"></a>
# cape\_privacy.pandas.transformations.perturbation

<a name="cape_privacy.pandas.transformations.perturbation.NumericPerturbation"></a>
## NumericPerturbation Objects

```python
class NumericPerturbation(base.Transformation)
```

Add uniform random noise to a numeric Pandas series

Mask a numeric Pandas series by adding uniform random
noise to each value. The amount of noise is drawn from
the interval [min, max).

**Example**:

  ```
  s = pd.Series([0, 1, 2, 3, 4])
  perturb = NumericPerturbation(dtype=Integer, min=-10, max=10, seed=123)
  perturb(s) # pd.Series([3, -7, -3, -3])
  ```
  

**Attributes**:

- `dtype` _dtypes.Numerics_ - Pandas Series type
- `min` _int, float_ - the values generated will be greater then or equal to min
- `max` _int, float_ - the values generated will be less than max
  seed (int), optional: a seed to initialize the random generator

<a name="cape_privacy.pandas.transformations.perturbation.DatePerturbation"></a>
## DatePerturbation Objects

```python
class DatePerturbation(base.Transformation)
```

Add uniform random noise to a Pandas series of timestamps

Mask a Pandas series by adding uniform random noise to the
specified frequencies of timestamps. The amount of noise for
each frequency is drawn from the internal [min_freq, max_freq).

**Example**:

  ```
  s = pd.Series([datetime.date(year=2020, month=2, day=15)])
  perturb = DatePerturbation(frequency="MONTH", min=-10, max=10, seed=1234)
  perturb(s) # pd.Series([datetime.date(year=2020, month=11, day=11)])
  ```
  

**Attributes**:

- `frequency` _str, str list_ - one or more frequencies to perturbate
- `min` _int, int list_ - the frequency value will be greater or equal to min
- `max` _int, int list_ - the frequency value will be less than max
  seed (int), optional: a seed to initialize the random generator

