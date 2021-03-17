# Create a project

A project in Cape should represent one of your data science projects. Within the Cape project, you can add and manage data policies, as well as users associated with the project.

To create a new project, you need to be an `admin` user.

1. Run `projects create`, passing in a lable and description:
```shell
cape projects create "<LABEL>" "<DESCRIPTION>"
```
2. When you create a project, you are the only contributor associated with the project. You have the `project-owner` [user role](/understand/user-roles/). Add a `project-contributor`. This user must already exist. Refer to [create a user](/cape-core/cli/usage/create-user/) for guidance on creating users.
```shell
cape projects contributors add <CONTRIBUTOR_EMAIL> <LABEL> project-contributor
```
3. Now, list the project contributors:
```shell
cape project contributors list <LABEL>

# Output
Name                Email
<YOUR_NAME>         <YOUR_EMAIL>
<CONTRIBUTOR_NAME>  <CONTRIBUTOR_EMAIL>
```
4. To change a contributor's role, use the `role` command. Downgrade the contributor you created in step 3 to `project-reader`.
```shell
cape roles set --project <LABEL> <CONTRIBUTOR_EMAIL> project-reader
```