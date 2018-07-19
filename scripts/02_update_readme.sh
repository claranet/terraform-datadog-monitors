#!/bin/bash
set -xueo pipefail

source "$(dirname $0)/utils.sh"
goto_root

TO_PARSE="."
if [ ! -z ${1+x} ]; then
    TO_PARSE="$1"
fi

sed -i '/### Monitors summary ###/q' README.md
echo >> README.md
for path in $(find -mindepth 1 \( -path './incubator' -o -path './scripts' -o -path './testing'  -o -path '*/\.*' \) -prune -o -type d -print | sort); do
    directories=($(list_dirs $path))
    for i in $(seq 1 $((${#directories[@]}-1))); do
        echo -en "\t" >> README.md
    done
    echo -en "- [$(basename ${path})](https://bitbucket.org/morea/terraform.feature.datadog/src/master/" >> README.md
    for directory in "${directories[@]}"; do
        echo -en "${directory}/" >> README.md
    done
    echo ")" >> README.md
done

PATTERN_DOC="Related documentation"

for path in $(find $TO_PARSE -path ./incubator -prune -o -name 'monitors-*.tf' -print); do
    cd $(dirname $path)
    EXIST=0
    if [ -f README.md ]; then
        mv README.md README.md.bak
        EXIST=1
    fi
    module=$(list_dirs $(dirname ${path}))
    module_space=${module^^}
    module_dash=${module//[ ]/-}
    module_slash=${module//[ ]/\/}
    cat <<EOF > README.md
# ${module_space} DataDog monitors

## How to use this module

\`\`\`
module "datadog-monitors-${module_dash}" {
  source = "git::ssh://git@bitbucket.org/morea/terraform.feature.datadog.git//${module_slash}?ref={revision}"

  environment = "\${var.environment}"
  message     = "\${module.datadog-message-alerting.alerting-message}"
}

\`\`\`

## Purpose

Creates DataDog monitors with the following checks:

EOF
    SAVEIFS=$IFS
    IFS=$(echo -en "\n\b")
    for match in $(grep -E ^[[:space:]]+name[[:space:]]+= $(basename ${path})); do
        name=$(get_name "${match}")
        echo "- $name" >> README.md
    done
    IFS=$SAVEIFS
    terraform-docs md ./ >> README.md
    if [[ $EXIST -eq 0 ]]; then
        cat <<EOF >> README.md
## ${PATTERN_DOC}

EOF
    else
        grep -Pzo --color=never ".*${PATTERN_DOC}(.*\n)*" README.md.bak | head -n -1 >> README.md
        rm README.md.bak
    fi
    dos2unix README.md
    cd - >> /dev/null
done
