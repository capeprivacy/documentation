<a name="cape_privacy.spark.transformations.tokenizer"></a>
# cape\_privacy.spark.transformations.tokenizer

<a name="cape_privacy.spark.transformations.tokenizer.Tokenizer"></a>
## Tokenizer Objects

```python
class Tokenizer(base.Transformation)
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

<a name="cape_privacy.spark.transformations.tokenizer.ReversibleTokenizer"></a>
## ReversibleTokenizer Objects

```python
class ReversibleTokenizer(base.Transformation)
```

ReversibleTokenizer: map a string to a token to obfuscate it.

When applying the Tokenizer to a Spark series of type string,
each value gets mapped to a token (hexadecimal string).
If a value is repeated several times across the series, it always
get mapped to the same token in order to maintain the count.
A value can be mapped to different tokens by setting the key to a
different value.

This tokenizer allows tokens to be reversed to their original data
when the secret key is known.

**Attributes**:

- `key` - expect a string or byte string of length exactly 32 bytes.
- `encoding` - string identifying the Python encoding used for inputs.

<a name="cape_privacy.spark.transformations.tokenizer.TokenReverser"></a>
## TokenReverser Objects

```python
class TokenReverser(base.Transformation)
```

TokenReverser: recover string from token.

When applying the TokenReverser to a Spark series of tokens,
each token is mapped back to the string that was originally used
by ReversibleTokenizer to construct the token. The same key must
be used.

**Attributes**:

- `key` - expect a string or byte string of length exactly 32 bytes.
- `encoding` - string identifying the Python encoding used for outputs.

