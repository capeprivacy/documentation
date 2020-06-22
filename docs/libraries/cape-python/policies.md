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
    # Describe named transformations. [TODO - may/may not be in this release]
    # Named transformations allow you to reuse a transformation
    # with a set value throughout your policy.
    transformations:
        # This named transformation refers to a custom transformation
        # It assumes you have written a transformation called plusN, 
        # which accepts a single argument, "n".
        - plusTen:
            type: plusN
            n: 10
        # This named transformation uses the built-in Tokenizer transformation
        - my_tokenizer:
            type: Tokenizer
            token_length: 10
            charset: ascii
            key: "my secret"
    rules:
        # Required. The table name.
        - target: groceries
        # Required. The column name.
        - match: fruit
            actions:
            # This example shows a named transformation.
            # It tells the policy runner to apply the my_tokenizer transformation
            # to all fields in the "amount" column.
            - transform:
                name: my_tokenizer
        - match: fruit
            actions:
            # This example shows a named transformation.
            # It tells the policy runner to apply the plusTen transformation
            # to all fields in the "amount" column.
            - transform:
                name: plusTen
        # Target rows in the fruit column where the value is "apple"
        - match: weight
            actions:
                - transform:
                    # This example shows an unnamed transformation.
                    # It tells the policy runner to:
                    # (1) Apply the transformation NumericRounding 
                    # (2) 
                    type: NumericRounding
                    precision: 1
```

