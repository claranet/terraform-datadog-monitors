#!/bin/bash
set -xueo pipefail

source "$(dirname $0)/utils.sh"

cd $(dirname $0)

for script in [0-9][0-9]_*.sh; do
    ./${script} "$(get_scope $1)"
done
