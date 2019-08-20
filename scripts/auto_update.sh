#!/bin/bash

source "$(dirname $0)/utils.sh"
init scripts

for script in [0-9][0-9]_*.sh; do
    ./${script} "$(get_scope ${1:-})"
done
