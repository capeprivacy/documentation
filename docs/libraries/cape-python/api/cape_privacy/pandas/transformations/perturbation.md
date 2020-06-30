Module cape_privacy.pandas.transformations.perturbation
=======================================================

Classes
-------

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