# Tokens

In Cape there are two types of tokens that can be created to authenticate with different parts of Cape's architecture- user tokens and organization tokens.

## User Tokens
Individual user tokens are used to identify you to the Cape Coordinator, so you can register [`DataViews`](/libraries/pycape/reference/#dataview), create and run Cape [`Jobs`](/libraries/pycape/reference/#job) and perform other necessary functions. See the [pycape Usage docs](/libraries/pycape/usage/login) for instructions on how to use your user token to log into the [pycape Python library](/libraries/pycape).

User tokens can be generated from your _User Settings_.

![](../images/user-token.gif)

## Organization Tokens
Organizational tokens are used to run [Cape Workers](/understand/architecture/cape-workers/). These tokens facilitate the secure sharing of data across all workers that are collaborating on a project using Cape privacy. and are stored as environment variables.

Organizational tokens can be generated from your _Organization Settings_.

![](../images/org-token.gif)
