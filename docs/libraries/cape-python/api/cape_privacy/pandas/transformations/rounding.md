Module cape_privacy.pandas.transformations.rounding
===================================================

Classes
-------

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