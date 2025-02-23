#!/bin/bash

# Don't run as root
if [ "$EUID" -eq 0 ]; then 
    echo "Please don't run as root. Run as normal user."
    exit 1
fi

echo "Uninstalling Cursor..."

# Remove symbolic link
sudo rm -f /usr/local/bin/cursor

# Remove application files
rm -rf ~/Applications/cursor

# Remove desktop entry
rm -f ~/.local/share/applications/cursor.desktop

# Remove icon
rm -f ~/.local/share/icons/hicolor/512x512/apps/cursor.png

# Try to remove application directory if empty
rmdir ~/Applications 2>/dev/null || true

echo "Cursor has been uninstalled successfully!" 