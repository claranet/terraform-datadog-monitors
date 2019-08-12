#!/bin/bash

source "$(dirname $0)/utils.sh"
init
echo "Generate terraform outputs.tf files for every monitors modules"

# loop over every monitors set
for module in $(browse_modules "$(get_scope ${1:-})" 'monitors-*.tf'); do
    echo -e "\t- Generate outputs.tf for module: ${module}"
    cd ${module}
    # empty outputs
    > outputs.tf
    # loop over monitors for each set
    for monitor in $(cat monitors-*.tf | grep 'resource "datadog_monitor"' | awk '{print $3}' | tr -d '"' ); do
        # create output block for current monitor
        cat >> outputs.tf <<EOF
output "${monitor}_id" {
  description = "id for monitor ${monitor}"
  value       = datadog_monitor.${monitor}.*.id
}

EOF
    done
    cd - >> /dev/null
done
