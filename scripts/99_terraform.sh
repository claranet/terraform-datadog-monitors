#!/bin/bash
set -xueo pipefail

source "$(dirname $0)/utils.sh"
goto_root

for path in $(find "$(get_scope $1)" -path ./testing -prune -o -path ./incubator -prune -o -name 'inputs.tf' -print); do
    dir=$(dirname ${path})
    terraform init ${dir} >> /dev/null 2>&1
    terraform validate -check-variables=false ${dir}
done

terraform fmt
