Module cape_privacy.spark.transformations.base
==============================================

Classes
-------

`AbstractTransformation()`
:   

    ### Descendants

    * cape_privacy.spark.transformations.base.Transformation

    ### Instance variables

    `dtype`
    :

`Transformation(dtype: pyspark.sql.types.DataType)`
:   

    ### Ancestors (in MRO)

    * cape_privacy.spark.transformations.base.AbstractTransformation

    ### Descendants

    * cape_privacy.spark.registry_test.MockTransformation
    * cape_privacy.spark.transformations.perturbation.DatePerturbation
    * cape_privacy.spark.transformations.perturbation.NumericPerturbation
    * cape_privacy.spark.transformations.rounding.DateTruncation
    * cape_privacy.spark.transformations.rounding.NumericRounding
    * cape_privacy.spark.transformations.tokenizer.Tokenizer

    ### Instance variables

    `dtype`
    :