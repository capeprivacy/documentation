# Documentation

## Run the docs locally

Prerequisites:

* git
* Python (currently using 3.8.3)
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

## Style and tone

* American English
* UI elements are bold
* We are writing for data scientists. Be clear. Be formal.

## Debs notes to herself

pydoc-markdown using the mkdocs options can be used to create MkDocs-compatible sites from the Python code comments (choose the docs repo as the build dest)
Spotify's mono-repo plugin allows you to combo these in theory, but there's currently a bug: https://github.com/spotify/mkdocs-monorepo-plugin/issues/20
Still to solve: currently would involve manual steps (build in each code repo) Assume this can be scripted though.
