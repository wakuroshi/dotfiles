#!/bin/bash

# Get the directory where the script is located
DOTFILES_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

install_deps_arch() {
	echo -e "${BLUE}Updating system and installing dependencies...${NC}"
	sudo pacman -Syu --needed stow git wofi base-devel neovim waybar fastfetch zsh kitty mpc rmpc xdg-desktop-portal xdg-desktop-portal-wlr qt6-wayland qt5-wayland grim slurp wiremix wl-clipboard btop cava swww brightnessctl curl gcc tar playerctl pamixer mpv-mpris mpd-mpris ttf-ibmplex-mono-nerd xdg-desktop-portal-gtk ntfs-3g exfatprogs gvfs udisks2 thunar river kanshi yazi
}

install_deps_void() {
	echo -e "${GREEN}Embracing the void..."
	sudo xbps-install -Su stow git wofi base-devel neovim Waybar fastfetch zsh kitty mpc rmpc xdg-desktop-portal xdg-desktop-portal-wlr qt6-wayland qt5-wayland grim slurp wiremix wl-clipboard btop cava swww brightnessctl curl gcc tar playerctl pamixer mpv-mpris nerd-fonts xdg-desktop-portal-gtk ntfs-3g exfatprogs gvfs udisks2 thunar river kanshi yazi
}

stow_configs() {
	echo -e "${BLUE}Stowing configurations...${NC}"
	cd "$DOTFILES_DIR"

	# Loop through all directories in the dotfiles folder
	for dir in */; do
	# Remove the trailing slash for the stow command
	package=${dir%/}
	
	# Skip hidden directories
	if [[ "$package" == .* ]]; then
	continue
	fi

	echo -e "Linking package: ${GREEN}$package${NC}"
	stow -R "$package"
	done
}

# Menu
echo -e "${GREEN}wakuroshi Arch Linux Dotfiles Installer"
echo -e "${NC}----------------------------"
echo "1) Install dependencies (Arch linux)"
echo "2) Install dependencies (Void linux)"
echo -e "${BLUE}3) Stow"
echo -e "${RED}q) Quit"
echo -e "${NC}----------------------------"
read -p "Select an option: " choice

case $choice in
	1)
	install_deps_arch
	;;
	2)
	install_deps_void
	;;
	3)
	stow_configs
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
