#!/bin/bash
set -xueo pipefail

source "$(dirname $0)/utils.sh"
goto_root

for path in $(find . -path ./incubator -prune -o -name 'monitors-*.tf' -print); do
    cd $(dirname $path)
    > outputs.tf
    for monitor in $(grep 'resource "datadog_monitor"' $(basename $path) | awk '{print $3}' | tr -d '"' ); do
        echo $monitor
        cat <<EOF >> outputs.tf
output "${monitor}_id" {
  description = "id for monitor $monitor"
  value       = "\${datadog_monitor.${monitor}.id}"
}

EOF
    done
    cd - >> /dev/null
done
terraform fmt
