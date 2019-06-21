#!/bin/bash
set -xueo pipefail

# MON-478 fix sort order behavior on case 
export LC_COLLATE=C

source "$(dirname $0)/utils.sh"

cd $(dirname $0)

for script in [0-9][0-9]_*.sh; do
    ./${script} "$(get_scope $1)"
done
