#!/bin/bash

# Update all submodules to latest version of main branch
git submodule update --remote

apis=(cape-python)
for i in $apis;
do (
echo $i;
cd $i;
rm -r ../docs/libraries/${i}/api
# Generate docs with pdoc and output to the correct section of the docs website
pdoc --output-dir ../docs/libraries/${i}/api cape_privacy --force;

#TODO: strip leading whitespace
)
done



                                    