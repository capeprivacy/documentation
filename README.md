# Documentation

View the documentation: http://docs.capeprivacy.com

## Run the docs locally

Prerequisites:

* git
* Python (currently using 3.7 due to [Netlify limitations](https://github.com/netlify/build-image/blob/xenial/included_software.md))
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

3. Activate the virtual environment:

```
./venv/Scripts/activate
```

4. Install the Material theme and MkDocs:

```
pip install mkdocs-material
```

5. Build and run the docs locally:

```
mkdocs serve
```

You can now view the docs at `localhost:8080`.

## Contribute to the docs - Cape Privacy team

The main branch is live. All work should happen on another branch.

1. Follow the steps to [Run the docs locally](run-the-docs-locally). Before editing, create a new branch.

```
git branch -b <branchName>
```

2. Make your edits.

3. Push your branch:

```
git add *
git commit -m "Describe your changes"
git push --set-upstream origin <branchName>
```

4. Submit a pull request. Netlify automatically builds a demo of the site with your changes. Select **Details** next to **netlify/cp-docs-demo/deploy-preview** to view the demo. Try to have someone else review your work before merging.

5. Merge the pull request. Netlify automatically detects changes to the main branch and rebuilds and redeploys the live documentation site.


## Style and tone

* American English
* UI elements are bold
* We are writing for data scientists. Be clear. Be formal.
* Cape Privacy is singular
* Headings should be sentence case
* Avoid passive voice and weasel words.

## License

Licensed under Apache License, Version 2.0 (see [LICENSE](./LICENSE) or http://www.apache.org/licenses/LICENSE-2.0). Copyright as specified in [NOTICE](./NOTICE).