# linux-surfacebook2-rotation-bugfix

This makes the touchscreen
 work correctly when the screen is rotated on the following system:

- Ubuntu 19.04
- Surface Book 2 15"
- Gnome
- Setup.sh: https://github.com/qzed/linux-surface/commit/51c7f7a23419f4262bc7bf1b60d4e7e9830df0b7
- Kernel: https://github.com/qzed/linux-surface/releases/tag/v5.2.5-pre1 

# Installation

    git clone https://github.com/runekaagaard/linux-surfacebook2-rotation-bugfix.git
    cd linux-surfacebook2-rotation-bugfix
    ./install.sh

Then log in and out. Rotation of touchscreen should now work.

# Acknowledgments

Big praise to @jakeday and @qzed for bringing shiny things to linux!
