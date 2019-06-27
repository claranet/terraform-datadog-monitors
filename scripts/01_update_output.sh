#!/bin/bash
set -xueo pipefail

source "$(dirname $0)/utils.sh"
goto_root

# loop over every monitors set
for path in $(find "$(get_scope $1)" -name 'monitors-*.tf' -print | sort -fdbi); do
    cd $(dirname $path)
    # empty outputs
    > outputs.tf
    # loop over monitors for each set
    for monitor in $(grep 'resource "datadog_monitor"' $(basename $path) | awk '{print $3}' | tr -d '"' ); do
        # create output block for current monitor
        cat >> outputs.tf <<EOF
output "${monitor}_id" {
  description = "id for monitor $monitor"
  value       = datadog_monitor.${monitor}.*.id
}

EOF
    done
    cd - >> /dev/null
done
