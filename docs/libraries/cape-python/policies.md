# Policies

Cape Python requires data policies in YAML format. This example describes all the available YAML objects.

``` yaml
# Required. The policy name.
label: test_policy
# Required. The policy specification object.
spec:
    # Required. The Cape Privacy specification version. Must be 1.
    version: 1
    # Describe named transformations.
    # Named transformations allow you to reuse a transformation with a set value throughout your policy.
    transformations:
        - name: plusTen
            type: plusN
            args:
                n:
                    value: 10
    rules:
        # Required. The target data entity. 
        # The last part of the name (in this example, "transactions") 
        # must match the entity name in the policy application script.
        - target: records:transactions.transactions
        # Optional. Default: "read".
        # The action taken by the identity (user or service)
        action: read
        # Required. Accepted values are "allow" or "deny".
        # Grant or deny permission for the identity to perform the action
        effect: allow
        # Optional. Limit the target fields based on field values. [TODO: check final version]
        - where: fruit == "apple"
        transformations:
          # Optional. Default: "read".
          # The action taken by the identity (user or service)
          action: read
          # Required. Accepted values are "allow" or "deny".
          # Grant or deny permission for the identity to perform the action
          effect: allow
          transformations:
            # This example shows an unnamed transformation.
            # It tells the policy runner to:
            # (1) Target a field named "fruit"
            # (2) Apply the transformation plusN 
            # (3) Assign a value of 1 to n
            - field: fruit
              function: plusN
              args:
                      n:
                          value: 1
            # This example shows a named transformation.
            # It tells the policy runner to apply the plusTen transformation to the "amount" field.
            - field: amount
                named: plusTen

```
