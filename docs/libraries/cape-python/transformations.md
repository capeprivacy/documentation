# Transformations

Cape Python has five built-in transformation functions. This document describes what they do, and provides an example of how to use each transformation in your policy.

## DatePertubation

The DatePertubation transformation randomizes dates.

``` yaml
transform:
  type: DatePertubation
  frequency: year
  min: 0
  max: 3
  seed: none
```

## DateTruncation

The DateTruncation transformation [TODO]

``` yaml
# This example tells the policy runner to:
# (1) Apply the transformation "DateTruncation" 
# (2) [TODO]
transform:
  type: DateTruncation
  frequency: [TODO]
```

## NumericPertubation

The NumericPertubation transformation [TODO]

``` yaml
# This example tells the policy runner to:
# (1) Apply the transformation "NumericPertubation" 
# (2) [TODO]
transform:
  type: NumericPertubation
  dtype: [TODO]
  min: [TODO]
  max: [TODO]
  seed: none
```

## NumericRounding

The NumericRounding transformation rounds numeric values ([TODO - numbers, floats . . . how will it handle being pointed at a string?])

``` yaml
# This example tells the policy runner to:
# (1) Apply the transformation "NumericRounding" 
# (2) [TODO]
transform:
  type: NumericRounding
  precision: [TODO]
```

## Tokenizer

``` yaml
# This example tells the policy runner to:
# (1) Apply the tranformation "Tokenizer"
# (2) 

transform:
  type: Tokenizer
  max_token_length: [TODO]
  key: [TODO]
```