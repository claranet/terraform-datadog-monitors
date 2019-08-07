#!/bin/bash

source "$(dirname $0)/utils.sh"
init

# download awk script to hack terraform-docs
TERRAFORM_AWK="/tmp/terraform-docs.awk"
curl -Lso ${TERRAFORM_AWK} "https://raw.githubusercontent.com/cloudposse/build-harness/master/bin/terraform-docs.awk"

## root README generator
# only keep current README from begining to "Monitors summary" section (delete monitors list)
sed -i '/### Monitors summary ###/q' README.md
# add a newline after listing section
echo >> README.md
# loop over all ready monitors sets on the repo
for path in $(find -mindepth 1 -type d ! -path '*/.*' ! -path './scripts*' -print | sort -fdbi); do
    # split path in directories
    directories=($(list_dirs $path))
    # loop over directories in path
    for i in $(seq 1 $((${#directories[@]}-1))); do
        ## add tabulation for every subdirectory
        echo -en "\t" >> README.md
    done
    # add link to list of monitors sets
    echo -en "- [$(basename ${path})](https://git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors/tree/master/" >> README.md
    # add path to link
    for directory in "${directories[@]}"; do
        echo -en "${directory}/" >> README.md
    done
    # end of markdown link
    echo ")" >> README.md
done

# this is the pattern from where custom information is saved to be restored
PATTERN_DOC="Related documentation"

# loop over every monitors set readme
for path in $(find "$(get_scope ${1:-})" -name 'monitors-*.tf' -print | sort -fdbi); do
    cd $(dirname $path)
    EXIST=0
    if [ -f README.md ]; then
        mv README.md README.md.bak
        EXIST=1
    fi
    # module name from path
    module=$(list_dirs $(dirname ${path}))
    # module name with space as separator
    module_space=${module^^}
    # module name with dash as separator
    module_dash=${module//[ ]/-}
    # module name with slash as separator
    module_slash=${module//[ ]/\/}

    # (re)generate README from scratch
    cat <<EOF > README.md
# ${module_space} DataDog monitors

## How to use this module

\`\`\`
module "datadog-monitors-${module_dash}" {
  source = "git::ssh://git@git.fr.clara.net/claranet/pt-monitoring/projects/datadog/terraform/monitors.git//${module_slash}?ref={revision}"

  environment = var.environment
  message     = module.datadog-message-alerting.alerting-message
EOF

    # if README already exist
    if [[ $EXIST -eq 1 ]]; then
        # take all custom config in declaration module example after "message" and until the end of block to restore it
        sed -n '/^[[:space:]]*message[[:space:]]*=.*/,/^\}/p' README.md.bak | tail -n +2 | head -n -1 >> README.md
    fi

    # close block and generate the next until list of monitors
    cat <<EOF >> README.md
}

\`\`\`

## Purpose

Creates DataDog monitors with the following checks:

EOF
    SAVEIFS=$IFS
    # allow looping over strings which contains spaces
    IFS=$(echo -en "\n\b")
    # loop over each monitor in the set
    for match in $(grep -E ^[[:space:]]+name[[:space:]]+= $(basename ${path}) | sort -fdbi); do
        ## TODO rewrite this (and other things) using:
        ## terraform-config-inspect --json| jq -C
        ## awk '1;/^\}/{exit}' monitors-ingress.tf # with line numer of each resource
        # parse monitor's name
        name=$(get_name "${match}")
        # search if monitor is enabled
        [[ "$(grep -B1 "$name" $(basename ${path}) | grep -q enabled)" =~ ^[[:space:]]*count[[:space:]]*=[[:space:]]*var\.([a-z0-9_]*_enabled) ]] &&
        # add "disabled by default" mention if not enabled
        if ! grep -A4 "${BASH_REMATCH[1]}" inputs.tf | grep default.*true; then
            name="${name} (disabled by default)"
        fi
        # monitor name element to the list and replace "could reach" pattern to "forecast" for better naming
        echo "- ${name/could reach/forecast}" >> README.md
    done
    IFS=$SAVEIFS
    echo >> README.md
    # hack for terraform-docs with terraform 0.12 / HCL2 support
    tmp_tf=$(mktemp -d)
    awk -f ${TERRAFORM_AWK} ./*.tf > ${tmp_tf}/main.tf
    # auto generate terraform docs (inputs and outputs)
    terraform-docs --with-aggregate-type-defaults md table ${tmp_tf}/ >> README.md
    rm -fr ${tmp_tf}
    # if README does not exist
    if [[ $EXIST -eq 0 ]]; then
        # Simply add empty documentation section
        cat <<EOF >> README.md
## ${PATTERN_DOC}

EOF
    else
        # else restore the custom information saved before
        grep -Pzo --color=never ".*${PATTERN_DOC}(.*\n)*" README.md.bak | head -n -1 >> README.md
        rm README.md.bak
    fi
    # force unix format (I don't know why for now but you never know)
    dos2unix README.md 2> /dev/null
    cd - >> /dev/null
done
