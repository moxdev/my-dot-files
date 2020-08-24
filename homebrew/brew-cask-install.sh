#!/bin/sh

echo " Installing Homebrew Cask Versions"
brew tap homebrew/cask-versions

echo " Installing native apps using \`brew cask\`."
brew cask install 1password
brew cask install 1clipboard
brew cask install adobe-creative-cloud
brew cask install alfred
brew cask install appcleaner
brew cask install bettertouchtool
brew cask install betterzip
brew cask install box-sync
brew cask install caffeine
brew cask install carbon-copy-cloner
brew cask install daisydisk
brew cask install dash
brew cask install docker
brew cask install dropbox
brew cask install firefox
brew cask install homebrew/cask-versions/firefox-developer-edition
brew cask install google-chrome
brew cask install hyper
brew cask install iterm2
brew cask install itsycal
brew cask install karabiner-elements
brew cask install macdown
brew cask install microsoft-edge
brew cask install notion
brew cask install private-internet-access
brew cask install qlmarkdown
brew cask install qlimagesize
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install quicklook-json
brew cask install qlvideo
brew cask install sequel-pro
brew cask install skype
brew cask install slack
brew cask install spectacle
brew cask install sublime-text
brew cask install suspicious-package
brew cask install teamviewer
brew cask install transmit
brew cask install vanilla
brew cask install visual-studio-code
brew cask install vlc

echo " Successfully installed all brew cask apps."