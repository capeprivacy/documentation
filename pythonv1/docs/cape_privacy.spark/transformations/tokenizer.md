<a name=".cape_privacy.spark.transformations.tokenizer"></a>
# cape\_privacy.spark.transformations.tokenizer

<a name=".cape_privacy.spark.transformations.tokenizer.Tokenizer"></a>
## Tokenizer Objects

```python
class Tokenizer(base.Transformation):
 |  Tokenizer(max_token_len=None, key=None)
```

Tokenizer: map a string to a token to obfuscate it.

When applying the tokenizer to a Spark series of type string,
each value gets mapped to a token (hexadecimal string).
If a value is repeated several times across the series, it always
get mapped to the same token in order to maintain the count.
A value can be mapped to different tokens by setting the key to a
different value.

**Attributes**:

- `max_token_len` _int or bytes_ - control the token length (default
  length is 64)
- `key` - expect a string or byte string. if not specified, key will
  be set to a random byte string.

<a name=".cape_privacy.spark.transformations.tokenizer_test"></a>
# cape\_privacy.spark.transformations.tokenizer\_test

