#!/bin/bash
set -xueo pipefail

source "$(dirname $0)/utils.sh"
goto_root

provider_version=$(grep ^[[:space:]]*version[[:space:]]= README.md | awk '{print $3}')

for path in $(find "$(get_scope ${1-})" -name 'inputs.tf' -print); do
    dir=$(dirname ${path})
    cat <<EOF > ${dir}/tmp.tf
provider "datadog" {
  version = $provider_version

  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
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
    if [ -f ${dir}/test.tf.ci ]; then
        cat ${dir}/test.tf.ci >> ${dir}/tmp.tf
    fi
    terraform init ${dir}
    terraform validate ${dir}
    rm -f ${dir}/tmp.tf
done

terraform fmt -recursive

