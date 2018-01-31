#!/bin/sh

echo " Installing brew apps."

echo " Making sure we’re using the latest Homebrew."
brew update

echo " brew upgrade any already-installed formulae."
brew upgrade

echo " brew installing utility/essential programs."
brew install git
brew install tree
brew install wakeonlan

echo " Installing Powerline Fonts from GitHub"
brew install fontconfig
cp /usr/local/etc/fonts/fonts.conf.bak /usr/local/etc/fonts/fonts.conf

git clone https://github.com/powerline/fonts.git
./fonts/install.sh

echo " brew installing development dependencies."
brew install node

echo " Removing outdated versions from the cellar."
brew cleanup

echo " Successfully installed all brew apps.\n"