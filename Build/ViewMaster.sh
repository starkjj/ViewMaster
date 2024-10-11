#!/bin/sh
echo -ne '\033c\033]0;ViewMaster\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/ViewMaster.x86_64" "$@"
