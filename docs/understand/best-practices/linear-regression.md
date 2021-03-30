### Linear Regression Best Practices

- When training using `VerticallyPartitionedLinearRegression`, the algorithm expects a bound on its input data in order to avoid precision loss during model training. This means you will need to preprocess your data with attention to numeric precision, standardizing or normalizing it around the origin. See [its reference documentation](/libraries/pycape/reference/#pycapeverticallypartitionedlinearregression) for more details. 
- `DataView` indices must be aligned across parties before being used for a `VerticallyPartitionedLinearRegression`. We recommend coordinating this offline with the other parties you will be training with.
- Before running a large amount of data, try a smaller dummy data view, to quickly learn if there are any issues with alignment, precision or worker connectivity.
