#!/bin/bash

script_dir=$(dirname $0)
if [[ "$script_dir" == "." ]]; then
  cd ..
else
  cd "$(dirname $script_dir)"
fi

for dir in $(find -mindepth 2 -name README.md); do
    cd $(dirname $dir)
    pwd
    cp README.md README.md.bak
    sed -i '/Inputs/,$d' README.md
    terraform-docs md ./ | tail -n +2 >> README.md
    sed -i 's/## Inputs/Inputs/g' README.md
    sed -i '/Inputs/a ------' README.md
    sed -i 's/## Outputs/Outputs/g' README.md
    sed -i '/Outputs/a -------' README.md
    grep -Pzo '.*Related documentation(.*\n)*' README.md.bak >> README.md
    rm README.md.bak
    cd - >> /dev/null
done
