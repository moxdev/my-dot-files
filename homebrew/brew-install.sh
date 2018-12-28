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

echo " Git Configuration Setup."
git config --global user.name "Shane Biggs"
git config --global user.email "moxdev1@gmail.com"
git config --global github.user moxdev
git config --global color.ui true

echo " Installing fontconfig."
brew install fontconfig

echo " brew installing Node."
brew install node

echo " brew installing NVM."
brew install nvm

echo " Removing outdated versions from the cellar."
brew cleanup

echo " Successfully installed all brew apps."