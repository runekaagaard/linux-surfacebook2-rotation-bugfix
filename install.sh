#!/bin/bash
mkdir -p ~/.config/autostart
cp linux-surfacebook2-rotation-bugfix.desktop ~/.config/autostart/

sudo cp -a linux-surfacebook2-rotation-bugfix.sh /usr/bin/
echo "Login and out again, and touchscreen touch on screen rotation should start working."
