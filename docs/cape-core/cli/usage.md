# CLI usage

## NAME

cape - Cape is used to manage access to your sensitive data.

## SYNOPSIS

cape

**Usage**:

```
cape [GLOBAL OPTIONS] command [COMMAND OPTIONS] [ARGUMENTS...]
```

## COMMANDS

### config

Commands for setting and viewing local command line configuration.

#### view

List all local configuration settings.

#### clusters

Commands for adding, removing, and selecting cape clusters.

##### add

Add configuration for a cape cluster.

**--use, -u**: If provided, the cluster being created will also be set as the current cluster.

##### remove

Remove configuration for a cape cluster.

**--yes, -y**: If specified, the user will not be prompted to confirm their action before proceeding.

##### use

Set a cape cluster as your current cluster

### coordinator

Commands for starting and managing Cape coordinators.

#### start

Start an instance of the Cape coordinator.

**--file, -f**="": Configuration file locations. Multiple files can be passed where the previous file is overridden by the next.

**--instance-id**="": An identifier to provide for uniquely identifying this process. One will be generated if not provided.

**--log-level**="": The level of log to report when dispatching logs (options: trace, debug, info, warn, error, fatal) (default: info)

**--logger**="": The type of logger to use for disptaching logs (options: pretty, discard, json) (default: json)

#### configure

Generates a Cape Coordinator configuration file.

**--format**="": The format of the configuration file (options: secret, config-map)

**--out, -o**="": Where to output the config file. (default: config.yaml)

**--port, -p**="": The `PORT` the port will attempt to listen on. (default: 0)

## login

Creates a session on the coordinator.

**--cluster**="": The cluster to login to.

**--email**="": The email used to log into the cluster.

### logout

Removes session on the client and the server.

**--cluster**="": The cluster to login to.

### projects

Commands for interacting with Cape projects.

#### suggestions

Commands for interacting with policy suggestions.

##### get

Get more information about a policy suggestion.

**--cluster**="": The cluster to login to.

##### approve

Approve a policy suggestion.

**--cluster**="": The cluster to login to.

##### reject

Reject a policy suggestion.

**--cluster**="": The cluster to login to.

##### list

List your a projects policy suggestions.

**--cluster**="": The cluster to login to.

##### create

Suggest a policy change in a project.

**--cluster**="": The cluster to login to.

**--from-spec**="": The spec file you wish to use.

#### create

Creates a project in Cape.

**--cluster**="": The cluster to login to.

#### list

List your Cape projects.

**--cluster**="": The cluster to login to.

#### update

Update a projects attributes.

**--cluster**="": The cluster to login to.

**--description**="": The description of the project.

**--from-spec**="": The spec file you wish to use.

**--name**="": The name of the project.

#### get

Get a details of a project.

### roles

Commands for querying information about roles and modifying them.

#### me

Tells you what your role is.

**--cluster**="": The cluster to login to.

**--project**="": The label identifier for the project.

### tokens

Commands for managing API tokens.

#### create

Creates a token for the specified user.

#### list

Lists the tokens IDs for a specified user.

#### remove

Removes the provided token from Cape.

### update

Update a running Cape coordinator to a new version.

### users

Commands for querying information about users and modifying them.

#### create

Create a new user.

**--cluster**="": The cluster to login to.
