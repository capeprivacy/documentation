# CLI usage

## NAME

cape - Cape is used to manage access to your sensitive data

## SYNOPSIS

cape

**Usage**:

```
cape [GLOBAL OPTIONS] command [COMMAND OPTIONS] [ARGUMENTS...]
```

## COMMANDS

### config

Commands for setting and viewing local command line configuration

#### view

List all local configuration settings

#### clusters

Commands for adding, removing, and selecting cape clusters

##### add

Add configuration for a cape cluster

**--use, -u**: If provided, the cluster being created will also be set as the current cluster

##### remove

Remove configuration for a cape cluster

**--yes, -y**: If specified, the user will not be prompted to confirm their action before proceeding

##### use

Set a cape cluster as your current cluster

### coordinator

Commands for starting and managing Cape coordinators.

#### start

Start an instance of the Cape coordinator

**--file, -f**="": Configuration file locations. Multiple files can be passed where the previous file is overridden by the next.

**--instance-id**="": An identifier to provide for uniquely identifying this process. One will be generated if not provided.

**--log-level**="": The level of log to report when dispatching logs (options: trace, debug, info, warn, error, fatal) (default: info)

**--logger**="": The type of logger to use for disptaching logs (options: pretty, discard, json) (default: json)

#### configure

Generates a Cape coordinator configuration file

**--format**="": The format of the configuration file (options: secret, config-map)

**--out, -o**="": Where to output the config file (default: config.yaml)

**--port, -p**="": The `PORT` the port will attempt to listen on (default: 0)

### login

Creates a session on the coordinator

**--cluster**="": The cluster to login to

**--email**="": The email used to log into the cluster

### logout

Removes session on the client and the server

**--cluster**="": The cluster to login to

### policies

Commands for querying information about policies and modifying them

#### attach

Attaches a policy to the given role

**--cluster**="": The cluster to login to

**--from-file**="": Loads a policy from a file and creates it

#### detach

Detaches a policy from the given role

**--cluster**="": The cluster to login to

**--yes, -y**: If specified, the user will not be prompted to confirm their action before proceeding

#### list

Lists all the policies on the cluster

**--cluster**="": The cluster to login to

### attach

Attaches a policy to the given role

**--cluster**="": The cluster to login to

**--from-file**="": Loads a policy from a file and creates it

### detach

Detaches a policy from the given role

**--cluster**="": The cluster to login to

**--yes, -y**: If specified, the user will not be prompted to confirm their action before proceeding

### projects

Commands for interacting with Cape projects

#### create

Creates a project in Cape

**--cluster**="": The cluster to login to

#### list

List your Cape projects

**--cluster**="": The cluster to login to

#### update

Update a projects attributes

**--cluster**="": The cluster to login to

**--description**="": The description of the project

**--from-spec**="": The spec file you wish to use

**--name**="": The name of the project

### roles

Commands for querying information about roles and modifying them

#### create

Create a new role

**--cluster**="": The cluster to login to

**--member, -m**="": Members to assign the specified role to

#### remove

Remove command removes a role

**--cluster**="": The cluster to login to

**--yes, -y**: If specified, the user will not be prompted to confirm their action before proceeding

#### list

Lists all the roles on the cluster

**--cluster**="": The cluster to login to

#### members

Lists all the users assigned a role

**--cluster**="": The cluster to login to

### setup

Setup Cape

**--email**="": The email used to log into the cluster

**--name**="": The name of a user

### tokens

Commands for managing API tokens

#### create

Creates a token for the specified user

#### list

Lists the tokens IDs for a specified user

#### remove

Removes the provided token from Cape

### update

Update a running Cape coordinator to a new version

### users

Commands for querying information about users and modifying them

#### create

Create a new user

**--cluster**="": The cluster to login to
 <nil>
NAME:
   cape - Cape is used to manage access to your sensitive data

USAGE:
   cape [global options] command [command options] [arguments...]

VERSION:
   0.0.0

COMMANDS:
   config       Commands for setting and viewing local command line configuration
   coordinator  Commands for starting and managing Cape coordinators.
   login        Creates a session on the coordinator
   logout       Removes session on the client and the server
   policies     Commands for querying information about policies and modifying them
   attach       Attaches a policy to the given role
   detach       Detaches a policy from the given role
   projects     Commands for interacting with Cape projects
   roles        Commands for querying information about roles and modifying them
   setup        Setup Cape
   tokens       Commands for managing API tokens
   update       Update a running Cape coordinator to a new version
   users        Commands for querying information about users and modifying them
   help, h      Shows a list of commands or help for one command

See 'cape help <command>' to read about a specific command.

GLOBAL OPTIONS:
   --help, -h     Display documentation and examples for this command (default: false)
   --version, -v  Display the current version of Cape (default: false)

COPYRIGHT:
   (c) 2020 Cape, Inc.
