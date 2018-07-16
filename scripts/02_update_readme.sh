#!/bin/bash
set -xeo pipefail

script_dir=$(dirname $0)
if [[ "$script_dir" == "." ]]; then
  cd ..
else
  cd "$(dirname $script_dir)"
fi

PATTERN_DOC="Related documentation"

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
    if ! grep "${PATTERN_DOC}" README.md.bak; then
        echo "Error: missing documentation section in README"
        exit 1
    fi
    grep -Pzo --color=never ".*${PATTERN_DOC}(.*\n)*" README.md.bak | head -n -1 >> README.md
    dos2unix README.md
    rm README.md.bak
    cd - >> /dev/null
done
