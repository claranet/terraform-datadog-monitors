#!/bin/bash

source "$(dirname $0)/utils.sh"
init
echo "Check best practices respect"

echo -e "\t- Check only one notify_no_data set to true per module"
# loop over every monitors set
for path in $(browse_modules "$(get_scope ${1:-})" 'monitors-*.tf'); do
    # check if there is more than 1 notify_no_data parameter set to true per set of monitors
    if [[ $(grep -c notify_no_data.*true $path) -gt 1 ]]; then 
        echo "More than one notify_no_data set to true on $path"
        exit 1
    fi
done
