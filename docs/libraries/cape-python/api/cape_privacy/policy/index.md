Module cape_privacy.policy
==========================

Sub-modules
-----------
* cape_privacy.policy.data
* cape_privacy.policy.data_test
* cape_privacy.policy.exceptions
* cape_privacy.policy.policy
* cape_privacy.policy.policy_test
* cape_privacy.policy.policy_test_fixtures

Functions
---------


`parse_policy(p: str)`
:   Parses a policy yaml file.

The passed in string can either be a path to a local file or
a URL pointing to a file. If it is a URL then requests attempts to download it.

Args:
p: a path string or a URL string

Returns:
The Policy object initialized by the yaml.

Classes
-------

`NamedTransformNotFound(...)`
:   Common base class for all non-exit exceptions.

### Ancestors (in MRO)

* builtins.Exception
* builtins.BaseException

`Policy(label: str, version: int = 1, rules: List[cape_privacy.policy.data.Rule] = [], transformations: List[cape_privacy.policy.data.NamedTransform] = [])`
:   Top level policy object.

The top level policy object holds the all of the relevant information
for applying policy to data.

Attributes:
label: The label of the policy.
version: The version of the policy.
rules: List of rules that will be applied to a data frame.
transformations: The named transformations for this policy.

`TransformNotFound(...)`
:   Common base class for all non-exit exceptions.

### Ancestors (in MRO)

* builtins.Exception
* builtins.BaseException