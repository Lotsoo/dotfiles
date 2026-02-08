#!/usr/bin/env bash

# Screenshot menu with rofi
# Uses unified Catppuccin theme

SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SCREENSHOT_DIR"

OPTIONS="📷  Area → Clipboard
💾  Area → Save
🖥️  Fullscreen → Clipboard
💾  Fullscreen → Save
🪟  Window → Clipboard
💾  Window → Save"

CHOICE=$(echo -e "$OPTIONS" | rofi -dmenu \
    -p "📸 Screenshot" \
    -i \
    -theme-str '
        @import "~/.config/rofi/themes/catppuccin.rasi"

        window { width: 350px; }
        listview { lines: 6; }
    ')

FILENAME="$SCREENSHOT_DIR/screenshot_$(date +%Y%m%d_%H%M%S).png"

case "$CHOICE" in
    "📷  Area → Clipboard")
        grim -g "$(slurp)" - | wl-copy
        notify-send "Screenshot" "Area copied to clipboard" -i camera
        ;;
    "💾  Area → Save")
        grim -g "$(slurp)" "$FILENAME"
        notify-send "Screenshot" "Saved to $FILENAME" -i camera
        ;;
    "🖥️  Fullscreen → Clipboard")
        grim - | wl-copy
        notify-send "Screenshot" "Fullscreen copied to clipboard" -i camera
        ;;
    "💾  Fullscreen → Save")
        grim "$FILENAME"
        notify-send "Screenshot" "Saved to $FILENAME" -i camera
        ;;
    "🪟  Window → Clipboard")
        GEOM=$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')
        grim -g "$GEOM" - | wl-copy
        notify-send "Screenshot" "Window copied to clipboard" -i camera
        ;;
    "💾  Window → Save")
        GEOM=$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')
        grim -g "$GEOM" "$FILENAME"
        notify-send "Screenshot" "Saved to $FILENAME" -i camera
        ;;
    *)
        exit 0
        ;;
esac
