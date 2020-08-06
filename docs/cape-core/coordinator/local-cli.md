# Install and run Cape Coordinator using the Cape CLI

This document describes how to install and run Cape Coordinator on your local machine, using the Cape CLI. This setup allows you to try out Cape Coordinator without going through the full [Kubernetes deployment process](/cape-core/coordinator/kubernetes/).

## Set up PostgreSQL for Cape

The following instructions include how to install PostgreSQL with a package manager for Linux and macOS, and using a GUI installer for Windows. For alternative PostgreSQL installation methods, refer to the [PostgreSQL downloads page](https://www.postgresql.org/download/). Postgresql version 11.0+ is required.

All Windows instructions assume you are using PowerShell.

=== "Linux"
    1. Install PostgreSQL. Refer to the guidance for your distribution: [PostgreSQL downloads](https://www.postgresql.org/download/).
    2. Create a user:
    ```shell
    # Create a user named cape
    createuser -U postgres --createdb --pwprompt cape
    ```
    3. Create a Cape database:
    ```shell
    createdb -U cape cape
    ```

=== "MacOS"
    1. Install Postgres. This requires Homebrew: https://brew.sh/
    ```shell
    brew install postgres
    ```
    2. Create a user: 
    ```shell
    # Create a user named cape.
    createuser -U postgres --createdb --pwprompt cape
    ```
    3. Create a Cape database:
    ```shell
    createdb -U cape cape
    ```

=== "Windows (PowerShell)"
    We recommend using the GUI installer for PostgreSQL on Windows. There is also a [Chocolatey package](https://chocolatey.org/packages/postgresql) available.

    1. Download the installer from [PostgreSQL Windows installers](https://www.postgresql.org/download/windows/).
    2. Run the installer. Accept the default settings at each stage. It will prompt you to set a password for the postgres user. Make a note of this password.
    3. Do not launch StackBuilder when the installation finishes.
    4. Create a user. When prompted, enter the postgres user password that you created during installation.
    ```shell
    # Create a user named cape.
    createuser -U postgres --createdb --pwprompt cape
    ```
    5. Create a database. When prompted, enter the user password you created in the previous step.
    ```shell
    # Create a database.
    createdb -U cape cape
    ```


## Download and set up Cape Coordinator

=== "Linux"    
    1. Download the Cape binary
    ```shell
    curl -O https://github.com/capeprivacy/cape/releases/download/v0.0.1/cape_0.0.1_Linux_x86_64.tar.gz
    tar xf cape_0.0.1_Linux_x86_64.tar.gz
    chmod +x ./cape
    ```
    2. Add cape to your PATH. Check the method for your Linux distro. If you skip this step, replace cape with `./cape` in subsequent commands.
    3. Download and extract the database schema files:
    ```shell
    curl -O https://github.com/capeprivacy/cape/releases/download/v0.0.1/capeprivacy-cape-postgres-v0.0.1.zip
    unzip capeprivacy-cape-postgres-v0.0.1.zip
    ```
    4. Create the database schema. Replace `<PASSWORD>` with your postgres user password.
    ```shell
    CAPE_DB_URL=postgres://postgres:<PASSWORD>@localhost:5432/cape
    cape update coordinator\migrations\
    ```
    5. Configure the Cape Coordinator server component:
    ```shell
    cape coordinator configure
    ```
    6. Cape asks you for information about your installation. For this example, use port `8080`. When this process completes, it creates a file called `config.yaml`. You can edit this file to change the inital configuration.
    7. Set user details, then start the coordinator. Make a note of the values you set for each field. You will use these to log in to Cape Coordinator.
    ```shell
    export CAPE_USER_NAME=<USERNAME>
    export CAPE_USER_EMAIL=<EMAIL>
    # The password must be eight characters minimum
    export CAPE_USER_PASSWORD=<PASSWORD>
    # Start the coordinator
    cape coordinator start --file config.yaml
    ```

    !!! note
        Cape Coordinator is now running in this window. If you close the terminal, or attempt further commands, you will stop Cape Coordinator.

=== "MacOS"
    1. Download the Cape binary
    ```shell
    curl -O https://github.com/capeprivacy/cape/releases/download/v0.0.1/cape_0.0.1_Linux_x86_64.tar.gz
    tar xf cape_0.0.1_Linux_x86_64.tar.gz
    chmod +x ./cape
    ```
    2. Add cape to your PATH. Check the method for your system. If you skip this step, replace cape with `./cape` in subsequent commands.
    3. Download and extract the database schema files:
    ```shell
    curl -O https://github.com/capeprivacy/cape/releases/download/v0.0.1/capeprivacy-cape-postgres-v0.0.1.zip
    unzip capeprivacy-cape-postgres-v0.0.1.zip
    ```
    4. Create the database schema. Replace `<PASSWORD>` with your postgres user password.
    ```shell
    CAPE_DB_URL=postgres://postgres:<PASSWORD>@localhost:5432/cape
    cape update coordinator\migrations\
    ```
    5. Configure the Cape Coordinator server component:
    ```shell
    cape coordinator configure
    ```
    6. Cape asks you for information about your installation. For this example, use port `8080`. When this process completes, it creates a file called `config.yaml`. You can edit this file to change the inital configuration.
    7. Set user details, then start the coordinator. Make a note of the values you set for each field. You will use these to log in to Cape Coordinator.
    ```shell
    export CAPE_USER_NAME=<USERNAME>
    export CAPE_USER_EMAIL=<EMAIL>
    # The password must be eight characters minimum
    export CAPE_USER_PASSWORD=<PASSWORD>
    # Start the coordinator
    cape coordinator start --file config.yaml
    ```

    !!! note
        Cape Coordinator is now running in this window. If you close the terminal, or attempt further commands, you will stop Cape Coordinator.

=== "Windows (PowerShell)"
    1. Download the Windows installer `.zip` from [Cape releases](https://github.com/capeprivacy/cape/releases).
    2. Unzip the installer.
    3. Copy the unzipped directory to a location of your choice.
    4. Add the directory to your `PATH`. Refer to [Add to Windows PATH environment variable](https://helpdeskgeek.com/windows-10/add-windows-path-environment-variable/) for help.
    5. If you are still using the same PowerShell window as in the previous section, run `refreshenv` to load the updated `PATH`.
    5. Download the database schema files: [capeprivacy-cape-postgres-v0.0.1.zip](https://github.com/capeprivacy/cape/releases/download/v0.0.1/capeprivacy-cape-postgres-v0.0.1.zip)
    6. Unzip the files.
    7. Run the following command to set up the database. Replace `<PASSWORD>` with the password you created when installing PostgreSQL.
    ```shell
    $env:CAPE_DB_URL='postgres://postgres:<PASSSWORD>@localhost:5432/cape'
    cape update coordinator/migrations

    # Configure the Cape Coordinator server component
    cape coordinator configure
    ```
    8. Cape asks you for information about your installation. For this example, use port `8080`. When this process completes, it creates a file called `config.yaml`. You can edit this file to change the inital configuration.
    9. Set user details, then start the coordinator. Make a note of the values you set for each field. You will use these to log in to Cape Coordinator.
    ```shell
    $env:CAPE_USER_NAME='<USERNAME>'
    $env:CAPE_USER_EMAIL='<EMAIL>'
    # The password must be eight characters minimum
    $env:CAPE_USER_PASSWORD='<PASSWORD>'
    # Start the coordinator
    cape coordinator start --file config.yaml
    ```
    
    !!! note
        Cape Coordinator is now running in this window. If you close the terminal, or attempt further commands, you will stop Cape Coordinator.

## Configure the CLI and log in to Cape

Open a new terminal or PowerShell window, and run the following commands. If you used a port other than `8080` when setting up Cape Coordinator, make sure to use your port number. You need the email and password you set in the previous section.

```shell
# Configure the Cape CLI
cape config clusters add local http://localhost:8080
cape config clusters use local
# Log in to Cape
cape login
```

At this point you can begin exploring Cape. Refer to the [usage tutorials](/cape-core/cli/usage/) for your next steps.

For more information about using your Cape installation check out [the CLI usage tutorials](/cape-core/cli/usage/) and a tutorial on [using the Coordinator with Cape Python](/libraries/cape-python/coordinator-quickstart/).
