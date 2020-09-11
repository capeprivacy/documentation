# Roles

In Cape, there are two contexts you can operate in:

 1. Global commands: these are things that affect how cape functions in your entire organization. For example, creating a user.
 2. Project commands: these are things that only affect the specific project you are operating on. For example, setting a policy on a project.

 Within each of these spaces, there are different roles that you can have.

 Globally, you can either be an `admin`, or a `user`. Admins can do anything in the system. It is much like
 being a superuser on a traditional linux system. `user` has much less access. They can read various details
 about the cape deployment, but not much more.

 Within a project, there are three roles:

 * `project-reader`: a project-reader can see what project details (for example, the title and description), and read what the policy is.
 * `project-contributor`: a project-contributor can do everything a reader can, plus suggest policy changes.
 * `project-owner`: a project-owner can do everything a contributor can do, plus approve or reject policy suggestions, add users to the project, and so on.


!!! note
    Cape refers to all users associated with a project as "contributors" to that project, and manages project users with the `contributors` command. In the documentation, "contributor" refers to any user in the project, while `project-contributor` refers to a user with the `project-contributor` role described in this document.
