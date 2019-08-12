#!/bin/bash

source "$(dirname $0)/utils.sh"
init
echo "Generate terraform outputs.tf files for every monitors modules"

# loop over every monitors set
for path in $(browse_modules "$(get_scope ${1:-})" 'monitors-*.tf'); do
    module=$(dirname ${path})
    echo -e "\t- Generate outputs.tf for module: ${module}"
    cd ${module}
    # empty outputs
    > outputs.tf
    # loop over monitors for each set
    for monitor in $(grep 'resource "datadog_monitor"' $(basename ${path}) | awk '{print $3}' | tr -d '"' ); do
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
