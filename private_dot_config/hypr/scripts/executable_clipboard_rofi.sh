#!/usr/bin/env bash

# Clipboard manager with cliphist + rofi
# With image previews

TMP_DIR="/tmp/cliphist_imgs"
mkdir -p "$TMP_DIR"

# Clean old thumbnails
find "$TMP_DIR" -type f -mmin +10 -delete 2>/dev/null

# Build entries with image thumbnails
build_menu() {
    local index=0
    while IFS= read -r line; do
        # Extract ID (first field before tab)
        id=$(echo "$line" | cut -f1)
        content=$(echo "$line" | cut -f2-)
        
        # Check if it's binary/image data
        if echo "$content" | grep -qE '^\[\[.*binary.*\]\]'; then
            # Try to decode as image
            cliphist decode "$id" > "$TMP_DIR/${id}.png" 2>/dev/null
            if [[ -s "$TMP_DIR/${id}.png" ]] && file "$TMP_DIR/${id}.png" | grep -q "image"; then
                echo -e "🖼️ Image ${index}\x00icon\x1f$TMP_DIR/${id}.png\x1finfo\x1f${id}"
            else
                rm -f "$TMP_DIR/${id}.png"
                echo -e "📦 Binary data\x00info\x1f${id}"
            fi
        else
            # Text entry - truncate for display
            preview=$(echo "$content" | head -c 60 | tr '\n\t' '  ')
            echo -e "📝 ${preview}\x00info\x1f${id}"
        fi
        ((index++))
    done < <(cliphist list | head -20)
}

# Show rofi with icons
selected=$(build_menu | rofi -dmenu \
    -p " Clipboard" \
    -i \
    -show-icons \
    -theme-str '
        @import "~/.config/rofi/themes/catppuccin.rasi"
        
        window { width: 600px; }
        listview { lines: 8; spacing: 6px; }
        element { padding: 8px; }
        element-icon { size: 80px; margin: 0 12px 0 0; border-radius: 8px; }
    ')

# Extract ID from info field and copy
if [[ -n "$selected" ]]; then
    # Get the ID from the info metadata
    id=$(echo "$selected" | grep -oP '(?<=info\x1f)[0-9]+' 2>/dev/null)
    
    # Fallback: try to get ID from cliphist directly by matching text
    if [[ -z "$id" ]] || ! [[ "$id" =~ ^[0-9]+$ ]]; then
        # Extract the display text (remove emoji prefix)
        display_text=$(echo "$selected" | sed 's/^[^ ]* //')
        # Find matching entry in cliphist
        id=$(cliphist list | grep -F "$display_text" | head -1 | cut -f1)
    fi
    
    if [[ -n "$id" ]] && [[ "$id" =~ ^[0-9]+$ ]]; then
        cliphist decode "$id" | wl-copy
        notify-send "Clipboard" "Copied!" -t 1000
    else
        # Last resort: just try to copy the selected text directly
        echo -n "${selected#* }" | wl-copy
        notify-send "Clipboard" "Copied (fallback)" -t 1000
    fi
fi
