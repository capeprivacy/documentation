# Audit Log

All user actions in Cape are captured and viewable in the audit log. Examples
of a tracked action include getting a [policy](./policy.md), logging in,
creating a new [project](./project.md), etc.

You must be a global `admin` to view the audit log.

The `audit` command has its own namespace in the Cape CLI

```
$ cape audit view
NAME:
   cape audit - Commands for querying the audit log.

USAGE:
   cape audit command [command options] [arguments...]

DESCRIPTION:
   Commands for querying the audit log.

COMMANDS:
   view     View the audit log.
   help, h  Shows a list of commands or help for one command

OPTIONS:
   --help, -h     Display documentation and examples for this command. (default: false)
   --version, -v  Display the current version of Cape. (default: false)
```

Audit log entries have the following attributes:

- `event_name`: A string representing the action (e.g. `create-project`).
- `user_id`: The ID of the user who performed this action.
- `user_email`: The email of the user who performed this action.
- `time`: A timestamp indicating when the action happened.
- `target_type`: What kind of object did this action happen against. For example, if a user created a project, you would see `project` as the target type.
- `target_id`: The ID of the target
- `target_label`: If the target has a label, it will be recorded. For example, if a user created a project called `my-project`, that label would appear here.
