#!/bin/bash
set -xueo pipefail

source "$(dirname $0)/utils.sh"
goto_root

# loop over every monitors set
for path in $(find "$(get_scope ${1-})" -name 'monitors-*.tf' -print | sort -fdbi); do
    # check if there is more than 1 notify_no_data parameter set to true per set of monitors
    if [[ $(grep -c notify_no_data.*true $path) -gt 1 ]]; then 
        echo "More than one notify_no_data set to true on $path"
        exit 1
    fi
done
