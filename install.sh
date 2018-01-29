#!/bin/sh

echo "\n Hey there. Never mind me, just setting up your system.\n"

./defaults/macos.sh

./homebrew/install.sh

cp .gitignore.global ~

echo " All done! Enjoy.\n"