#!/bin/bash

# kitty fonts settings
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Meslo.zip
unzip Meslo.zip -d ~/.local/share/fonts/
sudo fc-cache -fv
rm Meslo.zip

# Path to kitty config file
CONFIG_FILE="$HOME/.config/kitty/kitty.conf"
# Create config directory if it doesn't exist
mkdir -p "$(dirname "$CONFIG_FILE")"
# Backup existing config
cp "$CONFIG_FILE" "$CONFIG_FILE.bak" 2>/dev/null || touch "$CONFIG_FILE"
# Font configuration to add
FONT_CONFIG="font_family MesloLGS NF Regular
bold_font MesloLGS NF Bold
italic_font MesloLGS NF Italic
bold_italic_font MesloLGS NF Bold Italic
font_size 12.0"
# Remove existing font configurations
sed -i '/^font_family/d;/^bold_font/d;/^italic_font/d;/^bold_italic_font/d;/^font_size/d' "$CONFIG_FILE"
# Add new font configurations
echo -e "\n# Font configuration (added by script)" >> "$CONFIG_FILE"
echo "$FONT_CONFIG" >> "$CONFIG_FILE"
echo "Updated kitty font configuration in $CONFIG_FILE"

echo 'alias kittyx="KITTY_DISABLE_WAYLAND=1 kitty"' >> ~/.bashrc
source ~/.bashrc
