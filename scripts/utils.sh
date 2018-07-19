#!/bin/bash

function goto_root {
    script_dir=$(dirname $0)
    if [[ "$script_dir" == "." ]]; then
        cd ..
    else
        cd "$(dirname $script_dir)"
    fi
}

function list_dirs {
    echo ${1} | awk -F '/' '{$1=""; print $0}' | cut -c 2-
}

function get_name {
    regex='^[[:space:]]+name[[:space:]]+=[[:space:]]+"\[.*\][[:space:]]+(.*)"$'
    if [[ "${1}" =~ ${regex} ]]; then
        name="${BASH_REMATCH[1]}"
    else
        echo "Error: impossible to parse monitor name"
        return 42
    fi
    if [[ "${name}" =~ ^(.*)[[:space:]]\{\{#is_alert\}\}.*$ ]]; then
        name="${BASH_REMATCH[1]}"
    fi
    echo $name
    return 0
}
