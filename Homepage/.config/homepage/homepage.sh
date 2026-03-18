#!/bin/bash
TARGET_DIR="$HOME/homepage/"
PORT=8081
cd "$TARGET_DIR" || exit
python -m http.server $PORT --bind 127.0.0.1
