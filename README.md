# cursor-ubuntu-installer

A simple installer script for [Cursor](https://cursor.sh/) - an AI-first code editor - on Ubuntu and other Linux distributions.

## Features

- Downloads the latest version of Cursor
- Creates necessary application directories
- Sets up desktop integration (icon and application menu entry)
- Provides easy uninstallation

## Installation

1. Clone this repository:
   
   ```bash
   git clone https://github.com/lorenzo-portocarrero/cursor-ubuntu-installer
   cd cursor-ubuntu-installer
   ```

2. Make the installer script executable:
   
   ```bash
   chmod +x install_cursor.sh
   ```

3. Run the installer:
   
   ```bash
   ./install_cursor.sh
   ```

After installation, you can launch Cursor in two ways:
- Type `cursor` in your terminal
- Search for "Cursor" in your applications menu

## Uninstallation

To uninstall Cursor:

1. Make the uninstaller script executable:
   
   ```bash
   chmod +x uninstall_cursor.sh
   ```

2. Run the uninstaller:
   
   ```bash
   ./uninstall_cursor.sh
   ```

## Notes

- Do not run the scripts as root. They will handle elevated privileges when needed.
- The installer creates directories in your home folder and requires sudo access for creating a symbolic link.
- The application will be installed in `~/Applications/cursor/`

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.