# Roles

In Cape, there are five roles which have different permissions and responsibilities for using the Cape Cloud service. Each Cape user can be assigned a role when they join an organization. Currently, Cape only supports one role per user.

When you join a project, you will also be assigned a role by the person who invited you to the project.

!!! note
    Cape refers to all users associated with a project as "contributors" to that project, but their roles for that project have specific permissions. For example, if a user has a data scientist role on that project, they now can perform actions associated with that role on that project.

# Organizational-Level Roles

## Administrator (Organizational Level)

An organizational administrator has full permissions for all features on Cape Privacy. It is a role held by super administrators who need to on- and offboard other users and have the highest level of permissions on Cape.

Organizational Administrator Actions:

- Full permissions for organization, including:
    - Can add or remove persons from the organization
    - Can change roles for any members of the organization
    - Can delete the organization

- Full permissions for all projects that organization is a part of, including:
    - Can join or leave projects on behalf of an organization
    - Can add or edit contributors on all projects
    - Can add, remove data views for all projects
    - Can approve and run encrypted learning jobs for all projects

## Operator

An operator controls the organization's tokens and is in charge of deploying, running and monitoring Cape workers. They are able to revoke tokens and view all projects and project activity for an organization.

Operator Actions:

- Can view all organization projects and job / project activity
- Can issue / revoke organizational tokens
- Ability to install and download Cape Workers

## User

A Cape user can look at projects they are a member of and join and leave projects that they are invited to. They can only see and join projects they have been invited to by a Cape organization or project administrator.

User Actions:

- Join and leave projects I am invited to by an organizational or project administrator
- Can view projects pages and logs, but cannot change data views or jobs or approve or reject jobs


# Project-Level Roles

## Administrator (Project-Level)

A project administrator has full permissions for their organization's projects on Cape Privacy, add and edit contributors on projects they are a part of and perform necessary project actions like adding and removing data views or approving and running encrypted learning jobs.

Project Administrator Actions:

- Full permissions for all projects that organization is a part of, including:
    - Can add or edit contributors on all projects
    - Can add, remove data views for all projects
    - Can approve and run encrypted learning jobs for all projects

## Data Scientist

A Data Scientist can add, remove and edit data views and create, run, reject and approve encrypted learning jobs for projects. They can only see and join projects they have been invited to by a Cape organization or project administrator

Data Scientist Actions:

- Join and leave projects I am invited to by an organizational or project administrator
- Can add, remove data views for projects I am a part of
- Can create, approve, run encrypted learning jobs for projects I am a part of
- Can access metrics and model weights for jobs if my organization is the model owner


## User

A Cape user can look at projects they are a member of and join and leave projects that they are invited to. They can only see and join projects they have been invited to by a Cape organization or project administrator.

User Actions:

- Join and leave projects I am invited to by an organizational or project administrator
- Can view projects pages and logs, but cannot change data views or jobs or approve or reject jobs
