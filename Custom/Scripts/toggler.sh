#!/bin/bash
# ~/.local/bin/toggle-theme.sh

current=$(gsettings get org.gnome.desktop.interface color-scheme)

if [[ "$current" == "'prefer-light'" ]]; then
    # Switch to DARK mode
    gsettings set org.gnome.desktop.interface color-scheme "'prefer-dark'"
    
    # Set GTK theme to dark
    gsettings set org.gnome.desktop.interface gtk-theme "gruvbox-dark-gtk"
    
else
    # Switch to LIGHT mode
    gsettings set org.gnome.desktop.interface color-scheme "'prefer-light'"
    
    # Set GTK theme to light
    gsettings set org.gnome.desktop.interface gtk-theme "rose-pine-dawn-gtk"
    
fi
