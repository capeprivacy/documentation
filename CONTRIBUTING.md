# CONTRIBUTING

Contributions are more than welcome and we're always looking for ideas!

This document will help you:

* [Run the docs locally](#run-the-docs-locally), allowing you to preview your work.
* [Contribute to the docs](#contribute-to-the-docs).
* [Understand the docs tooling](#understand-the-docs-tooling).


## Run the docs locally

Prerequisites:

* git
* Python 64bit (currently using 3.7 due to [Netlify limitations](https://github.com/netlify/build-image/blob/xenial/included_software.md)).
* pip
* venv

1. Clone this repo:

```
git clone https://github.com/capeprivacy/documentation.git
```

2. In the `documentation` directory, create a virtual environment with [venv](https://docs.python.org/3/library/venv.html#module-venv):

```
python -m venv ./venv
```

3. Activate the virtual environment. The exact command depends on your shell:

```
# Powershell
./venv/Scripts/activate.ps1

# Bash
. venv/Scripts/activate
```

4. Install the [Material theme](https://squidfunk.github.io/mkdocs-material/), [MkDocs](https://www.mkdocs.org/) and [Pydoc-markdown](https://github.com/NiklasRosenstein/pydoc-markdown):

```
pip install -r requirements.txt
```

5. To view the docs locally:

```
mkdocs serve
```

You can now view the docs at `localhost:8080`. 

Note that this does not autogenerate the latest code documentation. Refer to [Understand the docs tooling](#understand-the-docs-tooling) for detailed information on the documentation setup.

## Contribute to the docs

This section describes how to edit the handwritten docs website content.

The main branch is live. All work should happen on another branch.

### Submitting a pull request

To contribute, [fork](https://help.github.com/articles/fork-a-repo/) Cape Python, commit your changes, and [open a pull request](https://help.github.com/articles/using-pull-requests/).

While you may be asked to make changes to your submission during the review process, we will work with you on this and suggest changes. Consider giving us [push rights to your branch](https://help.github.com/articles/allowing-changes-to-a-pull-request-branch-created-from-a-fork/) so we can potentially also help via commits.

### Style and tone

Refer to the [Writing style and tone](https://github.com/capeprivacy/documentation/wiki/Writing-style-and-tone) page in our wiki.

## Understand the docs tooling

Refer to the wiki [Documentation tooling](https://github.com/capeprivacy/documentation/wiki/Documentation-tooling) page.
