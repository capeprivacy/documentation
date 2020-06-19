# Applying Privacy-Enhancing Transformations to Your Data

The transformations within this library are useful for applying privacy-enhancing techniques to your data science and data engineering workflows. We have a few recommendations on how to leverage our initial transformations, and encourage community contributions to the repository (and to this guidance) as the techniques represented in transformations expand.

Cape Privacy recommends:

* Ensure that you have your data collected and joined before applying techniques, especially in the case of multiple sensitive columns.
* Currently, certain transformations require that sensitive data be contained in the policy files. For this reason, please keep your policy files stored securely. In future releases, we will support pulling transformation keys from key storage software, such as Vault.
* Consider using transformations as the final step in your pre-processing before creating a "clean sink" or "safe dataset". This means that you would then encourage your fellow data scientists (or yourself) to begin your work on that clean dataset. 
* Experiment with a few of the transformations directly on your data first to get an idea of how they impact your data utility. Figure out the right utility vs. privacy tradeoff for the task at hand and tweak your policy accordingly.
