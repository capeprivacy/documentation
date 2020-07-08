#!/bin/bash

# Update all submodules to latest version of main branch
echo "Updating submodules . . . "
git submodule update --remote

# Generate the Cape Python docs
echo "Generating Cape Python docs . . . "
pydoc-markdown
# pydoc-markdown generates mkdocs.yml with '\', which Netlify cannot handle: 
# https://github.com/NiklasRosenstein/pydoc-markdown/issues/129
sed -i -e 's/\\/\//g' ./pythonv1/mkdocs.yml

# Generate the Cape Core docs




                                    