# Redactions

Redactions are functions that alter your data. Unlike [transformations](/libraries/cape-python/transformations/), which modify but preserve data, redactions delete your data.

Cape Python has one built-in redaction function. This document describes what it does, and provides an example of how to use it in your policy.

!!! warning
    Redactions delete your data.

## Column redaction

The `column-redact` redaction deletes matching columns.

```yaml
- transform:
    type: "column-redact"
    # Replace <COLUMN_NAME> with the column name you want to redact.
    columns: ["<COLUMN_NAME>"] 
```

