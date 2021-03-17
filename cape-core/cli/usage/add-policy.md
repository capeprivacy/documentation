# Add a policy to a project

The data policy defines the data you want to change, and the [transformations](/libraries/cape-python/transformations/) or [redactions](/libraries/cape-python/redactions/) you want to apply. Cape Python requires data policies in YAML format. Refer to [policies](/libraries/cape-python/policies/) for guidance on writing a policy file.

You must be a `project-owner` to add a policy file. Refer to [user roles](/understand/user-roles/) for more information.

To add a policy to a project, use the `update` command. Replace `<LABEL>` with the project label you assigned when creating the project.

```shell
cape projects update --from-spec <PATH_TO_YOUR_POLICY_FILE> <LABEL>
```

