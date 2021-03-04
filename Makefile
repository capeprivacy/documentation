CODE_SRC=ref-src
CAPE_DS_BRANCH=main

bootstrap:
	pip install -r requirements.txt
	mkdir $(CODE_SRC)

dsdocs:
	rm -rf $(CODE_SRC)/pycape
	rm -rf docs/libraries/pycape/img
	rm -rf docs/libraries/pycape/usage
	rm -rf docs/libraries/pycape/tutorials
	git clone -b $(CAPE_DS_BRANCH) https://github.com/capeprivacy/pycape.git $(CODE_SRC)/pycape
	mv $(CODE_SRC)/pycape/docs/index.md docs/libraries/pycape/index.md
	mv $(CODE_SRC)/pycape/docs/img/ docs/libraries/pycape/
	mv $(CODE_SRC)/pycape/docs/usage/ docs/libraries/pycape/
	mv $(CODE_SRC)/pycape/docs/tutorials/ docs/libraries/pycape/

build:
	mkdocs build