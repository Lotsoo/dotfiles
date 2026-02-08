#!/bin/bash
# Check for available package updates

# For Arch-based (pacman)
if command -v checkupdates &> /dev/null; then
    updates=$(checkupdates 2>/dev/null | wc -l)
# For Debian/Ubuntu (apt)
elif command -v apt &> /dev/null; then
    updates=$(apt list --upgradable 2>/dev/null | grep -c upgradable)
# For Fedora (dnf)
elif command -v dnf &> /dev/null; then
    updates=$(dnf check-update -q 2>/dev/null | grep -c "")
else
    updates=0
fi

if [ "$updates" -gt 0 ]; then
    echo "󰏔  $updates"
else
    echo ""
fi
