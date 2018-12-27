#!/bin/sh

echo "\n Hey there. Never mind me, just setting up your system.\n"

./defaults/macos.sh

./homebrew/install.sh

./npm/npm-install.sh

./zsh/install.sh

cp .gitignore.global ~
cp .hushlogin ~

echo " All done! Enjoy.\n"