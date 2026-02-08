#!/bin/bash
# Media player script for waybar

player_status=$(playerctl status 2>/dev/null)

if [ "$player_status" = "Playing" ]; then
    artist=$(playerctl metadata artist 2>/dev/null | cut -c1-20)
    title=$(playerctl metadata title 2>/dev/null | cut -c1-25)
    if [ -n "$artist" ] && [ -n "$title" ]; then
        echo "󰎆  $artist - $title"
    elif [ -n "$title" ]; then
        echo "󰎆  $title"
    else
        echo "󰎆  Playing"
    fi
elif [ "$player_status" = "Paused" ]; then
    echo "󰏤  Paused"
else
    echo ""
fi
