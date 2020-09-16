# How to Install Cape Coordinator Enterprise with Kubernetes and Azure

This tutorial explains how to install Cape Coordinator into a Kubernetes cluster with Azure services.

## Prerequisites

Before you begin this tutorial, you will need the following:

- A Microsoft Azure Account [![External Link](/assets/images/extlink.svg)](https://azure.microsoft.com/en-us/resources/videos/sign-up-for-microsoft-azure/)
- A local installation of kubectl [![External Link](/assets/images/extlink.svg)](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- A local installation of helm [![External Link](/assets/images/extlink.svg)](https://helm.sh/docs/intro/install/)

## Sign in to Azure

Sign in to the Azure portal at [https://portal.azure.com](https://portal.azure.com).

## Create an AKS Cluster

Once you're signed in to Azure portal, you will need to create a Kubernetes cluster to deploy your cape services into. If you already have a Kubernetes cluster, proceed to the [next step](#create-an-azure-database-for-postgres).

> For more detailed information about creating an Azure Kubernetes Service cluster, including more configuration options and recommendations,  refer to the official documentation [here](https://docs.microsoft.com/en-us/azure/aks/).

1. From the Azure portal, select __Create a resource__

    ![Create a resource](/assets/images/azure/create_resource.png)

2. Select __Container__ then __Kubernetes service__

    ![Create a cluster](/assets/images/azure/create_cluster.png)

3. From the __Create Kubernetes cluster__ screen, select the Subscription and Resource Group for the cluster. If there is not an existing resource group, or you're unsure about which resource group to use, select __Create new__ to make a resource group for this cluster.

4. Give the cluster a name, and select a region, and Kubernetes version. We strongly recommend choosing the most recent available Kubernetes version (version 1.17.9 at the time of this writing).

5. For the remainder of the screens, you may leave all settings at their suggested defaults.

6. Select __Create__

7. Once your cluster is created, use the following command in your terminal to configure kubectl to use your new cluster:

```
az aks get-credentials --resource-group <group> --name <cluster name>
```

## Create an Azure Database for Postgres

Next you'll need a database to store configuration information about.

> For more detailed information about creating and using an Azure Database for Postgresql, refer to the official documentation [here](https://docs.microsoft.com/en-us/azure/postgresql/).

1. From the Azure portal, select __Create a resource__

    ![Create a resource](/assets/images/azure/create_resource.png)

2. Select __Database__ then __Azure Database for PostgreSQL__

3. Select __Single server__

4. From the __Single server__ screen, select the Subscription and Resource Group for the cluster. Select the same resource group you used for the Kubernetes cluster in the previous step.

4. Give the server a name, and choose __None__ for the Data source to create a new server from scratch.

5. Specify an admin username and password.

6. Select __Review and create__

## Create an Application in Active Directory

Next you will configure an application to grant your Cape deployment permission to access Azure resources for AzureAD authentication and Azure Key Vault Key Management.

1. From the Azure portal, select __Azure Active Directory__.

2. On the left hand pane, select __App Registrations__.

3. Select __New registration__

    ![App registrations](/assets/images/azure/app_registrations.png)

4. Name your application 'cape-coordinator', and enter https://<your cape URL>/oauth/azure/callback as the Redirect URI

    ![Enter application name and Redirect URI](/assets/images/azure/register_an_application.png)

5. Select __Register__

### Grant Permissions to enable Cape Enterprise Coordinator to use AzureAD authentication

1. From the Overview page, select __View API permissions__

    ![App registration overview](/assets/images/azure/app_registration_overview.png)

2. Select __Add a permision__

3. Select __Microsoft Graph__

4. Select __User__ and then __User.Read__

### Grant permission to enable Azure Key Vault integration

1. Click on something in the Azure portal

2. ...

3. Profit!!

## Create a Registry Secret to Access a Private Repository

In your terminal, create an image pull secret using the following command:

```
kubectl create secret docker-registry capeRegistryCredentials \
  --docker-server=<path-to-registry-server> \
  --docker-username=<registry-user-name> \
  --docker-password=<registry-user-password> \
  --docker-email=<registry-user-email>
```

## Install Cape Coordinator with Helm

Now that everything is in place, deploy the coordinator with helm.

Start by adding the repo:
```
helm repo remove cape
helm repo add cape https://capeprivacy-charts.storage.googleapis.com/
```

Next, create a `values.yaml` file with all of your settings.

```
image:
  pullPolicy: Always
  pullSecrets:
    - capeRegistryCredentials
service:
  type: "LoadBalancer"
  portName: cape-enterprise
  port: 80
config:
    db:
      addr: postgres://<postgres-user>:<postgres-password>@<postgres-server>.postgres.database.azure.com:5432/<postgres-database>
    root_key: azurekeyvault://<azure-vault-name>.vault.azure.net/keys/<key-name>
    cors:
        enable: true
        allow_origin:
          - <application-dns-name>
    user:
      name: <default admin user name>
      email: <default admin user email>
      password: <default admin user password>
azure:
  tenantID: <azure tenant ID>
  clientID: <azure client ID>
  clientSecret: <azure client secret>
```

And finally install the helm chart:

```
helm install -f values.yaml cape-coordinator cape/coordinator
```
