# Policies

The data policy defines the data you want to change, and the [transformations](transformations.md) you want to apply.

Cape Python requires data policies in YAML format. This example describes all the available YAML objects:

``` yaml
# Required. The policy specification object.
policy:
    # Required. The policy name.
    label: test_policy
    # Required. The Cape Privacy specification version. Must be 1.
    version: 1
    # Configure your named transformations.
    # Named transformations allow you to reuse a transformation
    # with a set value throughout your policy.
    transformations:
        # This named transformation uses the built-in tokenizer transformation
        - my_tokenizer:
            type: tokenizer
            token_length: 10
            charset: ascii
            key: "my secret"
    rules:
        # Required. The column name.
        - match: 
            name: fruit
        actions:
        # This example shows a named transformation.
        # It tells the policy runner to apply the my_tokenizer transformation
        # to all fields in the "amount" column.
        - transform:
            name: my_tokenizer
        - match: 
            name: fruit
        # Target rows in the fruit column where the value is "apple"
        - match: weight
            actions:
                - transform:
                    # This example shows an unnamed transformation.
                    # It tells the policy runner to:
                    # (1) Apply the transformation numeric-rounding 
                    # (2) Round to one decimal place
                    type: numeric-rounding
                    precision: 1
```

