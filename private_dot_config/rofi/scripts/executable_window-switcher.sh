#!/usr/bin/env bash

# Window switcher with rofi
# Uses unified Catppuccin theme

# Get list of windows
windows=$(hyprctl clients -j | jq -r '.[] | "\(.address) \(.class) - \(.title)"')

if [[ -z "$windows" ]]; then
    notify-send "Window Switcher" "No windows open" -t 1500
    exit 0
fi

# Show rofi
selected=$(echo "$windows" | rofi -dmenu \
    -p "🪟 Windows" \
    -i \
    -theme-str '
        @import "~/.config/rofi/themes/catppuccin.rasi"

        window { width: 600px; }
        listview { lines: 8; }
    ')

# Focus selected window
if [[ -n "$selected" ]]; then
    address=$(echo "$selected" | awk '{print $1}')
    hyprctl dispatch focuswindow address:$address
fi
