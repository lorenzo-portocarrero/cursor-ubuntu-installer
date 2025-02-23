#!/bin/bash

# Don't run as root
if [ "$EUID" -eq 0 ]; then 
    echo "Please don't run as root. Run as normal user."
    exit 1
fi

# Create necessary directories
mkdir -p ~/Applications/cursor
mkdir -p ~/.local/share/applications
mkdir -p ~/.local/share/icons/hicolor/512x512/apps

# Download Cursor
echo "Downloading Cursor..."
wget -O ~/Applications/cursor/cursor.AppImage "https://downloader.cursor.sh/linux/appImage/x64"

# Make it executable
chmod +x ~/Applications/cursor/cursor.AppImage

# Create symbolic link
sudo ln -sf ~/Applications/cursor/cursor.AppImage /usr/local/bin/cursor

# Extract icon from AppImage
echo "Extracting icon..."
~/Applications/cursor/cursor.AppImage --appimage-extract
mv squashfs-root/usr/share/icons/hicolor/512x512/apps/cursor.png ~/.local/share/icons/hicolor/512x512/apps/
rm -rf squashfs-root

# Update icon cache
echo "Updating icon cache..."
gtk-update-icon-cache -f -t ~/.local/share/icons/hicolor

# Create desktop entry
echo "Creating desktop entry..."
cat > ~/.local/share/applications/cursor.desktop << EOL
[Desktop Entry]
Name=Cursor
Exec=sh -c "cursor --no-sandbox"
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/icons/hicolor/512x512/apps/cursor.png
StartupWMClass=Cursor
X-AppImage-Version=230826o0n0w8o4p
Comment=Cursor is an AI-first coding environment.
MimeType=x-scheme-handler/cursor;
Categories=Utility;Development
EOL

# Update desktop database
update-desktop-database ~/.local/share/applications

echo "Installation completed!"
echo "You can now run Cursor AI by:"
echo "1. Typing 'cursor' in terminal"
echo "2. Searching for 'Cursor' in your applications menu" 