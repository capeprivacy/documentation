Module cape_privacy
===================

Sub-modules
-----------
* cape_privacy.pandas
* cape_privacy.policy
* cape_privacy.spark
* cape_privacy.utils

Functions
---------

    
`apply_policy(policy: cape_privacy.policy.data.Policy, df, inplace=False)`
:   Applies a Policy to some DataFrame.
    
    This function is responsible for inferring the type of the DataFrame, preparing the
    relevant Spark or Pandas Transformations, and applying them to produce a transformed
    DataFrame that conforms to the Policy.
    
    Args:
        policy: The `Policy` object that the transformed DataFrame will conform to, e.g.
            as returned by `cape_privacy.parse_policy`.
        df: The DataFrame object to transform according to `policies`. Must be of type
            pandas.DataFrame or pyspark.sql.DataFrame.
        inplace: Whether to mutate the `df` or produce a new one. This argument is only
            relevant for Pandas DataFrames, as Spark DataFrames do not support mutation.
    
    Raises:
        ValueError: If df is a Spark DataFrame and inplace=True, or if df is something
            other than a Pandas or Spark DataFrame.
        DependencyError: If Spark is not configured correctly in the Python environment.
        TransformNotFound, NamedTransformNotFound: If the Policy contains a reference to
            a Transformation or NamedTransformation that is unrecognized in the
            Transformation registry.

    
`parse_policy(p: str)`
:   Parses a policy yaml file.
    
    The passed in string can either be a path to a local file or
    a URL pointing to a file. If it is a URL then requests attempts to download it.
    
    Args:
        p: a path string or a URL string
    
    Returns:
        The Policy object initialized by the yaml.