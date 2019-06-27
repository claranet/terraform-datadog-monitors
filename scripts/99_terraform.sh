#!/bin/bash
set -xueo pipefail

source "$(dirname $0)/utils.sh"
goto_root

for path in $(find "$(get_scope $1)" -name 'inputs.tf' -print); do
    dir=$(dirname ${path})
    cd $dir
    cat <<EOF > tmp.tf
provider "datadog" {
  version = "2.0.2"

  api_key = "\${var.datadog_api_key}"
  app_key = "\${var.datadog_app_key}"
}

variable "datadog_api_key" {
  type = string
  default = "xxx"
}

variable "datadog_app_key" {
  type = string
  default = "yyy"
}
EOF
    terraform init
    terraform validate
    rm -f tmp.tf
    cd -
done

terraform fmt -recursive
