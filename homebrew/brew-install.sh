#!/bin/sh

echo " Installing brew apps."

echo " Making sure we’re using the latest Homebrew."
brew update

echo " brew upgrade any already-installed formulae."
brew upgrade

echo " brew installing utility/essential programs."
brew install fish

brew install tree
brew install wakeonlan

echo " brew installing development dependencies."
brew install node

echo " Removing outdated versions from the cellar."
brew cleanup

echo " Changing default shell to fish."
if ! grep --quiet $(which fish) /etc/shells; then
  sudo sh -c "echo $(which fish) >> /etc/shells"
fi
chsh -s $(which fish)

echo " Successfully installed all brew apps.\n"