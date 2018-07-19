#!/bin/bash
set -xueo pipefail

TO_PARSE="."
if [ ! -z ${1+x} ]; then
    TO_PARSE="$1"
fi

cd $(dirname $0)
for script in [0-9][0-9]_*.sh; do
    ./${script} $TO_PARSE
done
