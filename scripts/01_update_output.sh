#!/bin/bash
set -xeo pipefail

script_dir=$(dirname $0)
if [[ "$script_dir" == "." ]]; then
  cd ..
else
  cd "$(dirname $script_dir)"
fi

for file in $(find . -path ./incubator -prune -o -name 'monitors-*.tf' -print); do
    cd $(dirname $file)
    echo $file
    > outputs.tf
    for monitor in $(grep 'resource "datadog_monitor"' $(basename $file) | awk '{print $3}' | tr -d '"' ); do
        echo $monitor
        cat <<EOF >> outputs.tf
output "${monitor}_id" {
  description = "id for monitor $monitor"
  value       = "\${datadog_monitor.${monitor}.id}"
}

EOF
    done
    cd - >> /dev/null
done
terraform fmt
