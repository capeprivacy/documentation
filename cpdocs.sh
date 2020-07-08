#!/bin/bash

# Update all submodules to latest version of main branch
echo "Updating submodules . . . "
git submodule update --remote

# Generate the Cape Python docs
echo "Generating Cape Python docs . . . "
pydoc-markdown

# Generate the Cape Core docs




                                    