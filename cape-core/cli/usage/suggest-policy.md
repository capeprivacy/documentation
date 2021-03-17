# Suggest a policy change

Users with the `project-contributor` or `project-owner` [role types](/understand/user-roles/) can suggest changes to privacy policy through the CLI. This workflow changes the policy attached to a project.

1. Create a policy `YAML` file. This can be a new file, or a copy of an existing policy.
2. Write the new policy.
3. Submit the policy for approval:
```shell
cape projects policy create --from-spec <PATH_TO_YOUR_POLICY_FILE> "<TITLE>" "<DESCRIPTION>"
```
4. Project owners can review the suggestion:
```shell
# List all suggestions
cape policy list-suggestions <PROJECT_NAME>
# View details of a suggestion using the ID displayed by list-suggestions
cape policy get-suggestion <ID>
```
5. A project owner can choose to accept or reject the suggestion. If they approve it, the new policy replaces the old one attached to the project.
```shell
# Accept
cape policy approve <ID>
# Reject
cape policy reject <ID>
```
