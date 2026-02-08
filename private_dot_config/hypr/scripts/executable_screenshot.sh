#!/usr/bin/env bash

# Advanced Screenshot Script
# Takes screenshot, shows preview, waits for Ctrl+C (clipboard) or Ctrl+S (save)
# Usage: screenshot.sh [area|fullscreen|window]

MODE="${1:-fullscreen}"
SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
TEMP_FILE="/tmp/screenshot_preview.png"

mkdir -p "$SCREENSHOT_DIR"

# Take screenshot based on mode
case "$MODE" in
    area)
        grim -g "$(slurp)" "$TEMP_FILE" 2>/dev/null || exit 1
        ;;
    fullscreen)
        grim "$TEMP_FILE"
        ;;
    window)
        GEOM=$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')
        grim -g "$GEOM" "$TEMP_FILE"
        ;;
    *)
        echo "Usage: $0 [area|fullscreen|window]"
        exit 1
        ;;
esac

# Check if screenshot was taken
if [[ ! -f "$TEMP_FILE" ]]; then
    notify-send "Screenshot" "Failed to capture" -u critical
    exit 1
fi

# Show preview with imv (image viewer) and wait for input
# Using a small floating window
notify-send "Screenshot Preview" "Press Ctrl+C to copy, Ctrl+S to save, Esc to cancel" -t 5000

# Try imv first, fallback to feh, then to just notification
if command -v imv &>/dev/null; then
    # imv with custom key bindings
    imv -c "bind <Ctrl+c> exec echo 'COPY' > /tmp/ss_action && quit" \
        -c "bind <Ctrl+s> exec echo 'SAVE' > /tmp/ss_action && quit" \
        -c "bind <Escape> quit" \
        -W 800 -H 600 \
        "$TEMP_FILE" 2>/dev/null
    
    ACTION=$(cat /tmp/ss_action 2>/dev/null)
    rm -f /tmp/ss_action
elif command -v feh &>/dev/null; then
    # Use feh with action keys
    feh --class "screenshot-preview" \
        --action1 "echo 'COPY' > /tmp/ss_action" \
        --action2 "echo 'SAVE' > /tmp/ss_action" \
        --scale-down \
        --geometry 800x600 \
        "$TEMP_FILE" &
    FEH_PID=$!
    
    # Wait for keypress or feh to close
    sleep 10
    kill $FEH_PID 2>/dev/null
    ACTION=$(cat /tmp/ss_action 2>/dev/null)
    rm -f /tmp/ss_action
else
    # Fallback: use rofi to choose
    ACTION=$(echo -e "📋 Copy to Clipboard\n💾 Save to File\n❌ Cancel" | rofi -dmenu -p "Screenshot" -theme-str '
        @import "~/.config/rofi/themes/catppuccin.rasi"
        window { width: 300px; }
        listview { lines: 3; }
    ')
    
    case "$ACTION" in
        *Copy*) ACTION="COPY" ;;
        *Save*) ACTION="SAVE" ;;
        *) ACTION="" ;;
    esac
fi

# Process action
FILENAME="$SCREENSHOT_DIR/screenshot_$(date +%Y%m%d_%H%M%S).png"

case "$ACTION" in
    COPY)
        wl-copy < "$TEMP_FILE"
        notify-send "Screenshot" "Copied to clipboard! 📋" -i "$TEMP_FILE" -t 2000
        ;;
    SAVE)
        mv "$TEMP_FILE" "$FILENAME"
        notify-send "Screenshot" "Saved to $FILENAME 💾" -i "$FILENAME" -t 2000
        exit 0
        ;;
    *)
        notify-send "Screenshot" "Cancelled" -t 1000
        ;;
esac

# Cleanup
rm -f "$TEMP_FILE"
