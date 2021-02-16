CODE_SRC=ref-src
CAPE_DS_BRANCH=grace/documentation-CU-cevem0
CAPE_DS_SHA=e1e0f74

bootstrap:
	pip install -r requirements.txt
	mkdir $(CODE_SRC)

dsdocs:
	rm -rf $(CODE_SRC)/cape-ds
	git clone -b $(CAPE_DS_BRANCH) https://github.com/capeprivacy/cape-ds.git $(CODE_SRC)/cape-ds
	pip install -r $(CODE_SRC)/cape-ds/requirements.txt
	mv $(CODE_SRC)/cape-ds/docs/index.md docs/libraries/cape-ds/index.md
	mv $(CODE_SRC)/cape-ds/docs/usage/ docs/libraries/cape-ds/