#!/bin/sh
printf '\033c\033]0;%s\a' global-game-jam-2026-godot
base_path="$(dirname "$(realpath "$0")")"
"$base_path/global-game-jam-2026-godot.x86_64" "$@"
