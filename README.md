# Documentation

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

## Style and tone

* American English
* UI elements are bold
* We are writing for data scientists. Be clear. Be formal.
* Cape Privacy is singular

## License

Licensed under Apache License, Version 2.0 (see [LICENSE](./LICENSE) or http://www.apache.org/licenses/LICENSE-2.0). Copyright as specified in [NOTICE](./NOTICE).