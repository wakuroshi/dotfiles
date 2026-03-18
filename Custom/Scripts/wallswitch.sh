#!/bin/bash

WALLPAPER_DIR="$HOME/Media/Pictures/Wallpapers"

wallpapers=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" \))

selected=$(echo "$wallpapers" | wofi --dmenu -i --prompt "Wallpaper selection:")

if [ -n "$selected" ]; then
   swww img "$selected" --transition-type=grow
fi
