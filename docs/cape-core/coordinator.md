# Install Cape Coordinator via the Command-Line

## Set up Postgres for Cape

On MacOS:

```shell
# Install Postgres
brew install postgres

# Create a Cape user
createuser cape --createdb

# Create a Cape database
createdb cape -U cape
```

## Download Cape

```shell
# Download the Cape binary
curl -O https://github.com/capeprivacy/cape/releases/download/v0.1.0/capeprivacy-cape-v0.0.1.tgz
tar xf capeprivacy-cape-v0.0.1.tgz
chmod +x cape

# Download and extract the database schema files
curl -O https://github.com/capeprivacy/cape/releases/download/v0.1.0/capeprivacy-cape-postgres-v0.0.1.tgz
tar xf capeprivacy-cape-v0.0.1.tgz

# Create the database schema
cape update /path/to/schema/files/

# Configure the Cape Coordinator server component
cape coordinator configure
```

Cape will ask you for information about your installation, such as a port and database URL. For this example, use port 8181 and the following db URL: `postgres://cape:capepw@localhost/cape`

When this process completes, it will create a file called `config.yaml`. You can start the coordinator with this command:

```shell
cape coordinator start --file config.yaml
```

In another terminal, you can now configure the Cape CLI and log into Cape.

```shell
cape setup local http://localhost:8181
cape login
```

At this point you can begin exploring Cape:

```shell
cape projects list
```

For more information about using your Cape installation check out [here](https://link.to/more/amazing/docs).


# Install Cape Coordinator via Helm

This document describes how to deploy Cape Coordinator to Kubernetes. It assumes you are familiar with Kubernetes and Helm, and can configure your deployment environment.

## Prerequisites

To deploy Cape Coordinator, you need:

* A Kubernetes cluster (1.16+)
* A Helm installation (3.0+)
* A PostgreSQL database (11.0+)

> If you don't already have an environment to deploy Cape Coordinator into, refer to these guides to set up
> a local testing environment:
>
> - Kubernetes-in-Docker (Quick Start)[https://kind.sigs.k8s.io/docs/user/quick-start/]
> - Helm: (Quickstart Guide)[https://helm.sh/docs/intro/quickstart/]
> - PostgreSQL: (Bitnami Helm Chart)[https://github.com/bitnami/charts/tree/master/bitnami/postgresql#installing-the-chart]

## Installing Cape Coordinator with Helm

### Add the Cape Helm charts repository

```shell
helm repo remove cape
helm repo add cape https://capeprivacy-charts.storage.googleapis.com/
```

### Install the Helm chart

To install Cape Coordinator using the default values, use the following `helm` command:

```shell
helm install cape-coordinator cape/coordinator
```

The Helm chart supports many options that allow you to customize the Cape Coordinator deployment to suit your environment. For more information about these options, refer to [Configuration](#configuration).

## Configuration

The following table lists common configurable parameters of the chart and
their default values. See `values.yaml` for all available options.

|       Parameter                        |           Description                                                                                                                   |                         Default                                             |
|----------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------|
| `image.pullPolicy`                     | Container pull policy                                                                                                                   | `IfNotPresent`                                                              |
| `image.repository`                     | Container image to use                                                                                                                  | `capeprivacy/cape`                                                          |
| `image.tag`                            | Container image tag to deploy                                                                                                           | `latest`                                                                    |
| `podAnnotations`                       | List of custom annotations to attach to pods                                                                                            | `{}`                                                                        |
| `podLabels`                            | List of custom labels to attach to pods                                                                                                 | `{}`                                                                        |
| `annotations`                          | List of custom annotations to attach to all resources                                                                                   | `{}`                                                                        |
| `labels`                               | List of custom labels to attach to all resources                                                                                        | `{}`                                                                        |
| `replicas`                             | Number of instances of Cape coordinator                                                                                                 | `1                                                                          |
| `deploymentStrategy.type`              | Update strategy for deployment                                                                                                          | `RollingUpdate`                                                             |
| `serviceAccount.create`                | Enable or disable creation of a service account                                                                                         | `true`                                                                      |
| `serviceAccount.name`                  | Name of the service account to use for resources                                                                                        | `""`                                                                        |
| `service.type`                         | Cape Service type                                                                                                                       | `"ClusterIP"`                                                               |
| `service.port`                         | Port on which Cape coordinator listens                                                                                                  | `8080`                                                                      |
| `service.targetPort`                   | Port on which Cape coordinator pods listen                                                                                              | `3000`                                                                      |
| `service.uiPort`                       | Port on which to serve Cape web UI                                                                                                      | `80`                                                                        |
| `service.uiTargetPort`                 | Port on which Cape pods serve web UI                                                                                                    | `80`                                                                        |
| `service.annotations`                  | List of custome annotations to attach to the service                                                                                    | `{}`                                                                        |
| `service.labels`                       | List of custome labels to attach to the service                                                                                         | `{}`                                                                        |
| `service.portName`                     | Name of the port for on which Cape coordinator listens                                                                                  | `service`                                                                   |
| `admin.existingSecret`                 | Name of existing secret to use for certs and other configuration. Disables creation of helm-managed secret when set.                    | `""`                                                                        |
| `includeUI`                            | Enable or disable serving of the Cape web UI                                                                                            | `false`                                                                     |
| `uiImage.repository`                   | Container image to use for Cape web UI                                                                                                  | `capeprivacy/cape-ui`                                                       |
| `uiImage.tag`                          | Container image tag to use for Cape web UI                                                                                              | `latest`                                                                    |
| `uiImage.pullPolicy`                   | Container pull policy for Cape web UI                                                                                                   | `IfNotPresent`                                                              |
| `priorityClassName`                    | Scheduler priority class for pods                                                                                                       | `""`                                                                        |
| `schedulerName`                        | Alternative scheduler to use for Cape pods                                                                                              | `""`                                                                        |
| `namespaceOverride`                    | Namespace to use for Cape resources                                                                                                     | `""`                                                                        |
| `nameOverride`                         | Override for generated deployment name                                                                                                  | `""`                                                                        |
| `fullnameOverride`                     | Override for generated full name                                                                                                        | `""`                                                                        |
| `config.db.addr`                       | Address of the backing database for Cape coordinator                                                                                    | `"postgres://postgres:dev@postgres-cape-postgresql:5432/cape"`              |
| `config.port`                          | Port on which Cape coordinator containers listen                                                                                        | `8080`                                                                      |
| `config.root_key`                      | Root key for decrypting stored data keys                                                                                                | `ul0b9qQONZDn4kLNgULl3WJOZEhBqDjT1YK-kgceFUU`                               |
| `config.version`                       | Version of the configuration file supplied. Currently must be `1`                                                                       | `1`                                                                         |
| `config.cors`                          | Enable or disable servicing CORS headers on Cape coordinator responses                                                                  | `true`                                                                      |
| `config.allow_origin`                  | Origin hosts from which to allow API requests                                                                                           | `http://localhost:8080`                                                     |

Specify each parameter using the `--set[-file] key=value[,key=value]` argument to `helm install`.

## Uninstallation

```shell
helm delete cape-coordinator
```

To delete the deployment and its history:

```shell
helm delete --purge cape-coordinator
```
