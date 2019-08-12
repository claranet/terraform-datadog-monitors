#!/bin/bash

source "$(dirname $0)/utils.sh"
init
echo "Generate outputs.tf files when does not exist for every monitors modules"
root=$(basename ${PWD})

# loop over every monitors set
for module in $(browse_modules "$(get_scope ${1:-})" 'monitors-*.tf'); do
    cd ${module}
    # get name of the monitors set directory
    resource="$(basename ${module})"
    # if modules.tf does not exist AND if this set respect our tagging convention
    if ! [ -f modules.tf ] && grep -q filter_tags_use_defaults inputs.tf; then
        echo -e "\t- Generate modules.tf for module: ${module}"
        relative=""
        current="${PWD}"
        # iterate on path until we go back to root
        while [[ "$(basename $current)" != "$root" ]]; do
            # for each iteration add "../" to generate relative path
            relative="${relative}../"
            # remove last directory from current path
            current="$(dirname $current)"
        done
        # add the filter tags module
        cat > modules.tf <<EOF
module "filter-tags" {
  source = "${relative}common/filter-tags"

  environment                 = var.environment
  resource                    = "$resource"
  filter_tags_use_defaults    = var.filter_tags_use_defaults
  filter_tags_custom          = var.filter_tags_custom
  filter_tags_custom_excluded = var.filter_tags_custom_excluded
}

EOF
    fi
    cd - >> /dev/null
done
