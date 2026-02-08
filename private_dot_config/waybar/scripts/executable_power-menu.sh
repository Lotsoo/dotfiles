#!/usr/bin/env bash

# Power menu with rofi
# Uses unified Catppuccin theme

OPTIONS="⏻  Power Off
🔄  Restart
😴  Suspend
🔒  Lock
🚪  Logout"

CHOICE=$(echo -e "$OPTIONS" | rofi -dmenu \
    -p "⏻ Power" \
    -i \
    -theme-str '
        @import "~/.config/rofi/themes/catppuccin.rasi"

        * { urgent: #f38ba8; }
        window { width: 280px; border-color: @urgent; }
        prompt { color: @urgent; }
        listview { lines: 5; }
    ')

case "$CHOICE" in
    "⏻  Power Off")
        systemctl poweroff
        ;;
    "🔄  Restart")
        systemctl reboot
        ;;
    "😴  Suspend")
        systemctl suspend
        ;;
    "🔒  Lock")
        hyprlock
        ;;
    "🚪  Logout")
        hyprctl dispatch exit
        ;;
    *)
        exit 0
        ;;
esac
