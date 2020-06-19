# Applying transformations to your data

The Cape Privacy's libraries include built-in transformations. This document provides recommendations on how to use them. We encourage community contributions to this guidance as the transformation techniques grow.

## Recommendations

* Ensure that you have your data collected and joined before applying transformations, especially in the case of multiple sensitive columns.
* Some transformations require sensitive data to be contained in the policy files. For this reason, keep your policy files stored securely. In a future release, we will support pulling transformation keys from key storage software, such as Hashicorp Vault.
* Consider using transformations as the final step in your pre-processing before creating a "clean sink" or "safe dataset". This means that you can begin your work on that clean dataset. 
* Experiment with the transformations directly on your data to learn how they impact your data utility. Figure out the right utility vs. privacy tradeoff for the task at hand, and amend your policy accordingly.
