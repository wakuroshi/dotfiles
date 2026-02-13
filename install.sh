#!/bin/bash

DOTFILES_DIR=$(pwd)
CONFIG_DIR="$HOME/.config"

# Colors 
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Functions

install_deps() {
    echo -e "${BLUE}Updating system and installing dependencies...${NC}"
    # Package install, change as you need
    sudo pacman -Syu --needed git wofi base-devel neovim waybar fastfetch zsh kitty mpc rmpc xdg-desktop-portal xdg-desktop-portal-wlr qt6-wayland qt5-wayland grim slurp wiremix wl-clipboard btop cava swww brightnessctl curl gcc tar playerctl pamixer mpv-mpris mpd-mpris ttf-ibmplex-mono-nerd xdg-desktop-portal-gtk ntfs-3g exfatprogs gvfs udisks2 thunar river kanshi yazi
}

copy_configs() {
    echo -e "${BLUE}Copying .config files to $CONFIG_DIR...${NC}"
    
    # Ensure conf dir exists
    mkdir -p "$CONFIG_DIR"

    # Copy recursive verbose and backup 
    cp -rv --backup=numbered "$DOTFILES_DIR/.config/." "$CONFIG_DIR/"   
    echo -e "${GREEN}Copy complete! Existing files were backed up with a .~#~ suffix.${NC}"
}

# Menu
echo -e "${GREEN}wakuroshi Arch Linux Dotfiles Installer"
echo -e "${NC}----------------------------"
echo "1) Install dependencies (pacman)"
echo "2) Copy .config files to system"
echo -e "${BLUE}3) Do both"
echo -e "${RED}q) Quit"
echo -e "${NC}----------------------------"
read -p "Select an option: " choice

case $choice in
    1)
        install_deps
        ;;
    2)
        copy_configs
        ;;
    3)
        install_deps
        copy_configs
        ;;
    q|Q)
        echo "Exiting."
        exit 0
        ;;
    *)
        echo -e "${RED}Invalid option.${NC}"
        exit 1
        ;;
esac

echo -e "\n${GREEN}Process finished successfully!${NC}"
