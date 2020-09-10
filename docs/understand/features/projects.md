# Projects

Projects are the building block for Policy within Cape. In the real world, most
data access is granted depending on the use case and what the user is trying
to achieve. Cape groups all of those different use cases into projects.

For example, if you are a data scientist working for a bank in department A who is
tasked with creating a model to detect fraud. You may be able to train a better
model if you can use other customer data that belongs to department B. In this context,
you would create a project for this use case, and grant access (with whatever privacy
guarantees you need) to the scientists tasked with training a model.

Projects have the following attributes:

- `ID`: A unique identifier for the project
- `Name`: The name of the project
- `Label`: A url safe version of the name
- `Description`: A blob describing what this project is for
- `Created At`: When this project was first created
- `Updated At`: When any attributes about this project last changed

Commands to interact with projects exist under the `cape projects` namespace on the CLI.

```
$ cape projects

NAME:
   cape projects - Commands for interacting with Cape projects.

USAGE:
   cape projects command [command options] [arguments...]

DESCRIPTION:
   Commands for interacting with Cape projects.

COMMANDS:
   contributors  Commands for interacting with Cape Project Contributors.
   create        Creates a project in Cape.
   list          List your Cape projects.
   update        Update a projects attributes.
   get           Get a details of a project.
   policy        Commands for interacting with Cape Policy within a Project.
   help, h       Shows a list of commands or help for one command

OPTIONS:
   --help, -h     Display documentation and examples for this command. (default: false)
   --version, -v  Display the current version of Cape. (default: false)
```
