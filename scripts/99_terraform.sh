#!/bin/bash
set -xueo pipefail

source "$(dirname $0)/utils.sh"
goto_root

for path in $(find "$(get_scope $1)" -name 'inputs.tf' -print); do
    dir=$(dirname ${path})
    cat <<EOF > ${dir}/tmp.tf
provider "datadog" {
  version = "2.0.2"

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
    # hack to work around bug https://github.com/hashicorp/terraform/issues/21434
    # TODO when fixed, remove this bloc and add "terraform fmt -recursive" to the end of this file
    for file in $(grep ' = <<E' ${dir}/* | cut -d':' -f1 | sort | uniq); do
        sed -Ei '/<<EO(Q|F)/,/EO(Q|F)/ s/^#*/#/' ${file}
        terraform fmt ${dir}
        sed -Ei '/<<EO(Q|F)/,/EO(Q|F)/ s/^[[:space:]]*#//' ${file}
    done
done
