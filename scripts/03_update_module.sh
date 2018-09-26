#!/bin/bash
set -xueo pipefail

source "$(dirname $0)/utils.sh"
goto_root

root=$(basename ${PWD})

# loop over every monitors set
for path in $(find "$(get_scope $1)" -path ./incubator -prune -o -name 'monitors-*.tf' -print | sort -fdbi); do
    cd $(dirname $path)
    # get name of the monitors set directory
    resource="$(basename $(dirname $path))"
    # if modules.tf does not exist AND if this set respect our tagging convention
    if ! [ -f modules.tf ] && grep -q filter_tags_use_defaults inputs.tf; then
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

  environment              = "\${var.environment}"
  resource                 = "$resource"
  filter_tags_use_defaults = "\${var.filter_tags_use_defaults}"
  filter_tags_custom       = "\${var.filter_tags_custom}"
}
EOF
    fi
    cd - >> /dev/null
done
