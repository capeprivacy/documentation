# How to Install Cape Coordinator Enterprise with Kubernetes and Azure

This tutorial explains how to install Cape Coordinator into a Kubernetes cluster with Azure services.

## Prerequisites

Before you begin this tutorial, you will need the following:

- A Microsoft Azure Account
- A local installation of kubectl
- A local installation of helm

## Sign in to Azure

Sign in to the Azure portal at [https://portal.azure.com].

## Create an AKS Cluster

https://docs.microsoft.com/en-us/azure/aks/kubernetes-walkthrough-portal#create-an-aks-cluster

## Create an Azure Database for Postgres

https://docs.microsoft.com/en-us/azure/postgresql/quickstart-create-server-database-portal

## Create an Application in Active Directory

https://docs.microsoft.com/en-us/azure/active-directory/manage-apps/add-application-portal

## Configure Permissions for Authenticating with AzureAD

## Configure Azure Key Vault

## Create a Registry Secret to Access a Private Repository

## Install Cape Coordinator with Helm

```
image:
  pullPolicy: Always
  pullSecrets:
    - capeRegistryCredentials
includeUI: true
service:
  type: "LoadBalancer"
  portName: nginx
  port: 80
config:
    db:
      addr: postgres://<postgres-user>:<postgres-password>@<postgres-server>.postgres.database.azure.com:5432/<postgres-database>
    addr: ":8080"
    root_key: azurekeyvault://<azure-vault-name>.vault.azure.net/keys/<key-name>
    version: 1
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
