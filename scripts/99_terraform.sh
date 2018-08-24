#!/bin/bash
set -xueo pipefail

source "$(dirname $0)/utils.sh"
goto_root

for path in $(find "$(get_scope $1)" -path ./testing -prune -o -path ./incubator -prune -o -name 'inputs.tf' -print); do
    cd $(dirname ${path})
    echo $path
    terraform init
    terraform validate --check-variables=false
    cd -
done

terraform fmt
