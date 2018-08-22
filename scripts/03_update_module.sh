#!/bin/bash
set -xueo pipefail

source "$(dirname $0)/utils.sh"
goto_root

for path in $(find "$(get_scope $1)" -path ./incubator -prune -o -name 'monitors-*.tf' -print | sort -fdbi); do
    cd $(dirname $path)
    resource="$(basename $(dirname $path))"
    if ! [ -f modules.tf ] && grep -q filter_tags_use_defaults inputs.tf; then
        cat > modules.tf <<EOF
module "filter-tags" {
  source = "../../common/filter-tags"

  environment              = "\${var.environment}"
  resource                 = "$resource"
  filter_tags_use_defaults = "\${var.filter_tags_use_defaults}"
  filter_tags_custom       = "\${var.filter_tags_custom}"
}
EOF
    fi
    cd - >> /dev/null
done
