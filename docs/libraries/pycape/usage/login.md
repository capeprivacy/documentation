# Login to PyCape

To use **`pycape`**, you'll need to generate a [user token](/understand/features/tokens/). You'll use this token to authenticate requests to Cape Cloud.

After setting up an account in [Cape](https://app.capeprivacy.com), ensure you are
working within your user context and navigate to _Account Settings_ to generate a user token.

![](../img/user-token.gif)

Take note of this value as you cannot recover it after you reload the page.

```python
c = Cape()
c.login(token="abc,123", endpoint="http://cape.com")
```

It is also possible to set your Auth Token and Coordinator endpoint via the environment variables `CAPE_TOKEN` and `CAPE_COORDINATOR`.

```python
# Call the login method after exporting CAPE_TOKEN and CAPE_COORDINATOR.
c = Cape()
c.login()
```

Default response:

```shell
Login successful
```