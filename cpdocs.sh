#!/bin/bash

# Update all submodules to latest version of main branch
git submodule update --remote

# Generate the Cape Python docs
api=cape-python
echo $api
cd $api
# Generate docs with pdoc and output to the correct section of the docs website
pdoc3 --output-dir ../docs/libraries/cape-python/api cape_privacy --force
# Strip leading whitespace
cd ../docs/libraries/cape-python/api
for f in $(find cape_privacy -name '*.md')
    do (
    echo $f
    sed -i 's/^[[:space:]]*//g' $f
    )
done




                                    