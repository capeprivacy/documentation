# Cape Coordinator

## About Cape Coordinator

Cape Coordinator is a server application that manages access to policies and projects based on user authentication and user roles. 

Features include:

* Storing data in a database for retrieval.
* Exposing GraphQL and HTTP endpoints for managing Cape Coordinator.
* Exposing GraphQL and HTTP endpoints to retieve projects, policies and user information.
* Encrypting secret data (such as transformation keys and user credentails) before storing them in the database.

## Installation

There are two ways to install Cape Coordinator. Refer to the installation instructions for your preferred method:

* [Deploy to Kubernetes](/cape-core/coordinator/kubernetes.md) for production use, or if you are familiar with Kubernetes.
* [Install locally using the CLI](/cape-core/coordinator/local-cli.md) to try out Cape Coordinator on your local machine.



