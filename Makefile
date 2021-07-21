# Please be noticed that *this file is for the maintainer only*

deps: requirements-dev.txt
	@pip install -U -r requirements.txt

dev_deps:
	@pip install -U -r requirements-dev.txt

wheel: setup.py
	@python setup.py sdist bdist_wheel

test-publish: wheel
	@twine upload --repository-url https://test.pypi.org/legacy/ dist/*

publish: wheel
	@twine upload dist/*

install-keyring:
	@keyring set https://test.pypi.org/legacy/ unkloud
	@keyring set https://upload.pypi.org/legacy/ unkloud

clean:
	@rm -rf ./build ./dist ./hbdl.egg-info

.PHONY: dev_deps deps test-publish publish install-keyring clean
.DEFAULT_GOAL:=wheel
