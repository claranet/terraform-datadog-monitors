#!/bin/bash
set -xueo pipefail

source "$(dirname $0)/utils.sh"
goto_root

terraform fmt
