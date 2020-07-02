# Documentation

View the documentation: http://docs.capeprivacy.com

## Run the docs locally - quickstart

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

4. Install the [Material theme](https://squidfunk.github.io/mkdocs-material/), [MkDocs](https://www.mkdocs.org/) and [Pdoc3](https://pdoc3.github.io/pdoc/):

```
pip install -r requirements.txt
```

5. To view the docs locally:

```
mkdocs serve
```

You can now view the docs at `localhost:8080`. 

Note that this does not autogenerate the latest code documentation. Refer to [Understand the docs tooling](#understand-the-docs-tooling) for detailed information on the documentation setup, and [Contribute to the docs](#contribute-to-the-docs) for the steps to edit and add content.

## Contribute to the docs

This section describes how to edit the handwritten docs website content. To update the 

The main branch is live. All work should happen on another branch.

1. Follow steps 1-4 from [Run the docs locally](#run-the-docs-locally). Before editing, create a new branch:

```
git branch -b <branchName>
```

2. Make your edits.

3. Ensure you have the latest content from the code repos:

```
# Run this in `/documentation`, using a Bash shell. If you are on Windows, you can use Git Bash.

./cpdocs.sh
```

> **Note:** if there are new files, or names have changed, you must update the `mkdocs.yml` `nav` object.

4. Push your branch:

```
git add *
git commit -m "Describe your changes"
git push --set-upstream origin <branchName>
```

5. Submit a pull request. Netlify automatically builds a demo of the site with your changes. Select **Details** next to **netlify/cp-docs-demo/deploy-preview** to view the demo. Try to have someone else review your work before merging.

5. Merge the pull request. Netlify automatically detects changes to the main branch and rebuilds and redeploys the live documentation site.


## Style and tone

* American English
* UI elements are bold
* We are writing for data scientists. Be clear. Be formal.
* Cape Privacy is singular
* Headings should be sentence case
* Avoid passive voice and weasel words.

## Understand the docs tooling

The documentation website comprises:

* Content written in Markdown, in the documentation repository. This includes most of the introductory material, best practices guides, and similar. 
* Content written as code comments or docstrings in the Cape Privacy code. To include this in the website, we use git submodules, a tool for each language to generate markdown from code comments, and a Bash script to bring everything together.

## License

Licensed under Apache License, Version 2.0 (see [LICENSE](./LICENSE) or http://www.apache.org/licenses/LICENSE-2.0). Copyright as specified in [NOTICE](./NOTICE).