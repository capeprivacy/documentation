# Transformations

Transformations are functions that alter your data, ensuring it is free of sensitive information.

Cape Python has five built-in transformation functions. This document describes what they do, and provides an example of how to use each transformation in your policy.



## DatePertubation

The DatePertubation transformation adds random noise to dates. The amount of noise depends on the `min` and `max` values that you set in the policy.

``` yaml
transform:
  type: DatePertubation
  frequency: < 'year' or 'month' >
  min: < int or float >
  max: < int or float >
  # Optional. The base number to initialize the random number generator.
  seed: < int >
```

## DateTruncation

The DateTruncation transformation shortens dates to a unit (year or month). Set the unit in `frequency`.

``` yaml
transform:
  type: DateTruncation
  frequency: < 'year' or 'month' >
```

## NumericPertubation

The NumericPertubation transformation adds random noise to numeric data sets. The amount of noise depends on the `min` and `max` values that you set in the policy.

``` yaml
transform:
  type: NumericPertubation
  dtype: < Pandas Series type or Spark [TODO] >
  min: < int or float >
  max: < int or float >
  # Optional. The base number to initialize the random number generator.
  seed: < int >
```

## NumericRounding

The NumericRounding transformation rounds numeric values to a given number of decimal places. Use `precision` to set the number of decimal places.

``` yaml
transform:
  type: NumericRounding
  dtype: < Pandas Series type or Spark [TODO] >
  precision: < int >
```

## Tokenizer

The Tokenizer transformation maps a string to a token to obfuscate it.

!!! warning
    Linkable tokenization for sensitive data is vulnerable to privacy attacks. Cape privacy does not recommend sharing tokenized data with preserved linkability with untrusted or outside parties. Cape Python does not support anonymized transformations.

``` yaml
transform:
  type: Tokenizer
  # Default is 64
  max_token_length: < int or bytes >
  # If unspecified, Cape Python uses a random byte string
  key: < string or byte string >
```