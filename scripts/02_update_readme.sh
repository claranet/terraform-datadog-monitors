#!/bin/bash
set -xeo pipefail

script_dir=$(dirname $0)
if [[ "$script_dir" == "." ]]; then
  cd ..
else
  cd "$(dirname $script_dir)"
fi

sed -i '/### Monitors summary ###/q' README.md
echo >> README.md
for dir in $(find -mindepth 1 \( -path ./incubator -o -path ./scripts -o -path ./testing  -o -path ./.git \) -prune -o -type d -print | sort); do
    count=$(echo ${dir} | tr -cd '/' | wc -c)
    for i in $(seq 1 $((${count}-1))); do
        echo -en "\t" >> README.md
    done
    echo -en "- [$(basename ${dir})](https://bitbucket.org/morea/terraform.feature.datadog/src/master/" >> README.md
    for i in $(seq 2 $((${count}+1))); do
        echo -en "$(echo ${dir} | cut -d'/' -f ${i})/" >> README.md
    done
    echo ")" >> README.md
done

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
