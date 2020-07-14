#!/bin/bash

# Update all submodules to latest version of main branch
echo "Updating submodules . . . "
git submodule update --remote

# Generate the Cape Python docs
echo "Generating Cape Python docs . . . "
pydoc-markdown
# pydoc-markdown on Windows generates mkdocs.yml with '\', which Netlify cannot handle: 
# https://github.com/NiklasRosenstein/pydoc-markdown/issues/129
# using '#' as a delimeter to make this monstrosity less monstrous
sed -i -e 's#\\#\/#g' ./pythonv1/mkdocs.yml

# Generate the Cape Core docs




                                    