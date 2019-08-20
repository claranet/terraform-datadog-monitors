#!/bin/bash

source "$(dirname $0)/utils.sh"
init
echo "Update README.md for every monitors modules"

# download awk script to hack terraform-docs
TERRAFORM_AWK="/tmp/terraform-docs.awk"
curl -Lso ${TERRAFORM_AWK} "https://raw.githubusercontent.com/cloudposse/build-harness/master/bin/terraform-docs.awk"
# this is the pattern from where custom information is saved to be restored
PATTERN_DOC="Related documentation"

# loop over every modules
for module in $(browse_modules "$(get_scope ${1:-})" 'monitors-*.tf'); do
    echo -e "\t- Generate README.md for module: ${module}"
    cd ${module}
    EXIST=0
    if [ -f README.md ]; then
        mv README.md README.md.bak
        EXIST=1
    fi
    # module name from path
    module_space=$(list_dirs ${module})
    # module name with space as separator
    module_upper=${module_space^^}
    # module name with dash as separator
    module_dash=${module_space//[ ]/-}
    # module name with slash as separator
    module_slash=${module_space//[ ]/\/}

    # (re)generate README from scratch
    cat <<EOF > README.md
# ${module_upper} DataDog monitors

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
    list=""
    # gather a information line splitted with "|" for every monitor
    for row in $(terraform-config-inspect --json | jq -c -r '.managed_resources | map([.pos.filename, .pos.line] | join("|")) | join("\n")' | sort -fdbi); do
        # split line for each info one variable
        IFS='|' read filename line < <(echo $row)
        # gather all config HCL code for current monitor
        set +o pipefail
        config=$(tail -n +${line} ${filename} | sed '/^}/q')
        set -o pipefail
        # parse monitor's name
        name=$(get_name "$(echo "${config}" | grep 'name[[:space:]]*=')")
        # search if monitor is enabled
        [[ "$(echo "${config}" | grep 'count[[:space:]]*=')" =~ ^[[:space:]]*count[[:space:]]*=[[:space:]]*var\.([a-z0-9_]*_enabled) ]] &&
        # add "disabled by default" mention if not enabled
        if ! grep -A4 "${BASH_REMATCH[1]}" inputs.tf | grep -q default.*true; then
            name="${name} (disabled by default)"
        fi
        # append new line to list if not empty
        if ! [ -z "${list}" ]; then
            list="${list}\n"
        fi
        # append name to list and improve forecast naming
        list="${list}- ${name/could reach/forecast}"
    done
    # write sorted list to readme appending newline to end
    echo -e "$(echo -e "${list}" | sort -fdbi)\n" >> README.md
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
        rm -f README.md.bak
    fi
    # force unix format (I don't know why for now but you never know)
    dos2unix README.md 2> /dev/null
    cd - >> /dev/null
done
