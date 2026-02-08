#!/bin/bash
# Weather script using wttr.in

# Change "Jakarta" to your city
CITY="Jakarta"
CACHE_FILE="/tmp/waybar_weather_cache"
CACHE_AGE=1800  # 30 minutes

# Check if cache exists and is fresh
if [ -f "$CACHE_FILE" ]; then
    cache_time=$(stat -c %Y "$CACHE_FILE" 2>/dev/null || echo 0)
    current_time=$(date +%s)
    age=$((current_time - cache_time))
    
    if [ $age -lt $CACHE_AGE ]; then
        cat "$CACHE_FILE"
        exit 0
    fi
fi

# Fetch weather
weather=$(curl -s "wttr.in/${CITY}?format=%c+%t" 2>/dev/null | tr -d '+')

if [ -n "$weather" ] && [ "$weather" != "Unknown location" ]; then
    echo "$weather" | tee "$CACHE_FILE"
else
    echo "󰖐  N/A"
fi
