# Users

Users in Cape are much like users in other applications. All actions performed
within Cape must be performed by an authenticated user.

Users have the following attributes:

- `ID`: A unique identifier for the user
- `Name`: The full name of the user
- `Email`: An email address associated with the user
- `Created At`: When this user was first created
- `Updated At`: When any attributes about this user last changed

Commands to interact with users exists under the `cape users` namespace on the CLI.

```
$ cape users

NAME:
   cape users - Commands for querying information about users and modifying them.

USAGE:
   cape users command [command options] [arguments...]

DESCRIPTION:
   Commands for querying information about users and modifying them.

COMMANDS:
   create   Create a new user.
   help, h  Shows a list of commands or help for one command

OPTIONS:
   --help, -h     Display documentation and examples for this command. (default: false)
   --version, -v  Display the current version of Cape. (default: false)
```
