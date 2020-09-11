<a name="cape_privacy.pandas.transformations.tokenizer"></a>
# cape\_privacy.pandas.transformations.tokenizer

<a name="cape_privacy.pandas.transformations.tokenizer.Tokenizer"></a>
## Tokenizer Objects

```python
class Tokenizer(base.Transformation)
```

Tokenizer: map a string to a token to obfuscate it.

When applying the Tokenizer to a Pandas Series of type string,
each value gets mapped to a token (hexadecimal string).
If a value is repeated several times across the series, it always
get mapped to the same token in order to maintain the count.
A value can be mapped to different tokens by setting the key to a
different value.

**Example**:

  ```
  s = pd.Series(['A'])
  tokenize = Tokenizer(max_token_len=5, key='secret')
  tokenize(s) # pd.Series(['40a1e'])
  ```
  

**Attributes**:

- `max_token_len` _int or bytes_ - control the token length (default
  length is 64)
- `key` - expect a string or byte string. If not specified, key will
  be set to a random byte string.

<a name="cape_privacy.pandas.transformations.tokenizer.Tokenizer.__call__"></a>
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

<a name="cape_privacy.pandas.transformations.tokenizer.ReversibleTokenizer"></a>
## ReversibleTokenizer Objects

```python
class ReversibleTokenizer(base.Transformation)
```

ReversibleTokenizer: map a string to a token to obfuscate it.

When applying the Tokenizer to a Pandas Series of type string,
each value gets mapped to a token (hexadecimal string).
If a value is repeated several times across the series, it always
get mapped to the same token in order to maintain the count.
A value can be mapped to different tokens by setting the key to a
different value.

This tokenizer allows tokens to be reversed to their original data
when the secret key is known.

**Example**:

  ```
  s = pd.Series(['A'])
  tokenize = ReversibleTokenizer(key='secret')
  tokenize(s) # pd.Series(['40a1e'])
  ```
  

**Attributes**:

- `key` - expect a string or byte string of length exactly 32 bytes.
- `encoding` - string identifying the Python encoding used for inputs.

<a name="cape_privacy.pandas.transformations.tokenizer.ReversibleTokenizer.__call__"></a>
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

<a name="cape_privacy.pandas.transformations.tokenizer.TokenReverser"></a>
## TokenReverser Objects

```python
class TokenReverser(base.Transformation)
```

TokenReverser: recover string from token.

When applying the TokenReverser to a Pandas Series of tokens,
each token is mapped back to the string that was originally used
by ReversibleTokenizer to construct the token. The same key must
be used.

**Example**:

  ```
  s = pd.Series(['40a1e'])
  reverser = TokenReverser(key='secret')
  reverser(s) # pd.Series(['A'])
  ```
  

**Attributes**:

- `key` - expect a string or byte string of length exactly 32 bytes.
- `encoding` - string identifying the Python encoding used for outputs.

<a name="cape_privacy.pandas.transformations.tokenizer.TokenReverser.__call__"></a>
#### \_\_call\_\_

```python
 | __call__(series: pd.Series) -> pd.Series
```

Reverse a Pandas Series of tokens.

**Arguments**:

- `series` _A Pandas Series_ - need to be a list of strings.
  

**Returns**:

  A Pandas Series with a list of recovered strings.

