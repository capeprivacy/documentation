# Install and run Cape Coordinator using the Cape CLI

This document describes how to install and run Cape Coordinator on your local machine, using the Cape CLI. This setup allows you to try out Cape Coordinator without going through the full [Kubernetes deployment process](/cape-core/coordinator/kubernetes.md).

## Set up PostgreSQL for Cape

The following instructions include how to install PostgreSQL with a package manager for Linux and macOS, and using a GUI installer for Windows. For alternative PostgreSQL installation methods, refer to the [PostgreSQL downloads page](https://www.postgresql.org/download/).

=== "Linux"
    ```shell
    # Install PostgreSQL
    # Refer to the guidance for your distribution: https://www.postgresql.org/download/

    # Create a Cape user
    createuser --createdb cape

    # Create a Cape database
    createdb cape -U cape
    ```

=== "MacOS"
    ```shell
    # Install Postgres
    # Requires Homebrew: https://brew.sh/
    brew install postgres

    # Create a Cape user
    createuser --createdb cape

    # Create a Cape database
    createdb cape -U cape
    ```

=== "Windows"
    ```shell
    # Run PowerShell as administrator
    # Install PostgreSQL: https://chocolatey.org/packages/postgresql
    choco install postgresql --password test

    # Close the admin level PowerShell window
    # Open a new PowerShell window (not admin
    # Create a Cape user
    createuser --createdb cape

    # Create a Cape database
    createdb cape -U cape
    ```

## Download and set up Cape Coordinator

=== "Linux and macOS"
    ```shell
    # Download the Cape binary
    curl -O https://github.com/capeprivacy/cape/releases/download/v0.1.0/capeprivacy-cape-v0.0.1.tgz
    tar xf capeprivacy-cape-v0.0.1.tgz
    chmod +x cape

    # Download and extract the database schema files
    curl -O https://github.com/capeprivacy/cape/releases/download/v0.1.0/capeprivacy-cape-postgres-v0.0.1.tgz
    tar xf capeprivacy-cape-v0.0.1.tgz

    # Create the database schema
    CAPE_DB_URL=postgres://postgres:postgrespw@localhost:5432/cape cape update /path/to/schema/files/

    # Configure the Cape Coordinator server component
    cape coordinator configure
    ```
=== "Windows"
    1. Download [TODO - where to get the .exe]
    2. 

Cape asks you for information about your installation. For this example, use port 8181 and the following database URL: `postgres://cape:capepw@localhost:5432/cape`

When this process completes, it creates a file called `config.yaml`. 

Start the coordinator with this command:

```shell
CAPE_USER_NAME=cape_user CAPE_USER_EMAIL=cape_user@mycape.com CAPE_USER_PASSWORD=capecape cape coordinator start --file config.yaml
```

## Configure the CLI and log into Cape

Open a new terminal, and run the following commands:

```shell
# Configure the Cape CLI
cape config clusters add local http://localhost:8181
cape config clusters use local
# Log in to Cape
cape login
```

At this point you can begin exploring Cape:

```shell
cape projects list
```

For more information about using your Cape installation check out [here](https://link.to/more/amazing/docs).
