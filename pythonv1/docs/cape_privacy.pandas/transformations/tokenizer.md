<a name=".cape_privacy.pandas.transformations.tokenizer"></a>
# cape\_privacy.pandas.transformations.tokenizer

<a name=".cape_privacy.pandas.transformations.tokenizer.Tokenizer"></a>
## Tokenizer Objects

```python
class Tokenizer(base.Transformation):
 |  Tokenizer(max_token_len: int = None, key: str = None)
```

Tokenizer: map a string to a token to obfuscate it.

When applying the Tokenizer to a Pandas Series of type string,
each value gets mapped to a token (hexadecimal string).
If a value is repeated several times across the series, it always
get mapped to the same token in order to maintain the count.
A value can be mapped to different tokens by setting the key to a
different value.

**Examples**:

  ```
  s = pd.Series(['A'])
  tokenize = Tokenizer(max_token_len=5, key='secret')
  tokenize(s) # pd.Series(['40a1e'])
  ```
  

**Attributes**:

- `max_token_len` _int or bytes_ - control the token length (default
  length is 64)
- `key` - expect a string or byte string. if not specified, key will
  be set to a random byte string.

<a name=".cape_privacy.pandas.transformations.tokenizer.Tokenizer.__call__"></a>
#### \_\_call\_\_

```python
 | __call__(series: pd.Series) -> pd.Series
```

Map a Pandas Series to tokens.

**Arguments**:

- `series` _A Pandas Series_ - need to be a list of strings.
  

**Returns**:

  A Pandas Series with a list of tokens represented as hexadecimal
  strings.

