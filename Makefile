CODE_SRC=ref-src
CAPE_DS_BRANCH=grace/poetry

bootstrap:
	pip install -r requirements.txt
	mkdir $(CODE_SRC)

dsdocs:
	rm -rf $(CODE_SRC)/cape-ds
	rm -rf docs/libraries/cape-ds/img
	rm -rf docs/libraries/cape-ds/usage
	rm -rf docs/libraries/cape-ds/tutorials
	git clone -b $(CAPE_DS_BRANCH) https://github.com/capeprivacy/cape-ds.git $(CODE_SRC)/cape-ds
	mv $(CODE_SRC)/cape-ds/docs/index.md docs/libraries/cape-ds/index.md
	mv $(CODE_SRC)/cape-ds/docs/img/ docs/libraries/cape-ds/
	mv $(CODE_SRC)/cape-ds/docs/usage/ docs/libraries/cape-ds/
	mv $(CODE_SRC)/cape-ds/docs/tutorials/ docs/libraries/cape-ds/

build:
	mkdocs build