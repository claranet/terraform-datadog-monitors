#!/bin/bash

source "$(dirname $0)/utils.sh"
init
echo "Generate terraform outputs.tf files for every monitors modules"

# loop over every modules
for module in $(browse_modules "$(get_scope ${1:-})" 'monitors-*.tf'); do
    echo -e "\t- Generate outputs.tf for module: ${module}"
    cd ${module}
    # empty outputs
    > outputs.tf
    # gather a information line splitted with "|" for every monitor
    for row in $(terraform-config-inspect --json | jq -c -r '.managed_resources | map([.name] | join("|")) | join("\n")'); do
        # split line for each info one variable
        IFS='|' read monitor type < <(echo $row)
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
