#!/bin/sh

echo " Hey there. Never mind me, just setting up your system."

./defaults/install-macos-defaults.sh

./xcode/install-xcode-command-line-tools.sh

./homebrew/install-homebrew.sh

./npm/install-npm-packages.sh

./zsh/install-zsh.sh

echo " Setting up Hyper config file."
cp .hyper.js ~

echo " Setting up .gitignore.global file."
cp .gitignore.global ~

echo " Setting up .hushlogin file."
cp .hushlogin ~

echo " All done! Enjoy."