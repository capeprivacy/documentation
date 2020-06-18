# Transformations

The Cape Python API has four built-in transformation functions.

## Pertubation

The Pertubation transformation [TODO]

## PlusN

The PlusN transformation adds `n` to a data field.

``` yaml
# This example tells the policy runner to:
# (1) Target a field named "fruit"
# (2) Apply the transformation plusN 
# (3) Assign a value of 1 to n
transformations:
    - field: fruit
        function: plusN
        args:
            n:
                value: 1
```

## Rounding

The Rounding transformation [TODO]

## Tokenizer

The Tokenizer transformation [TODO]