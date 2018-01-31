#!/bin/sh

echo " Installing zsh."
brew install zsh zsh-completions
brew install zsh-autosuggestions

echo " Installing oh-my-zsh."
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

echo " Installing Wes Bos Cobalt2 iTerm and ZSH theme."
git clone https://github.com/wesbos/Cobalt2-iterm.git ~/zsh
cp ~/zsh/cobalt2.zsh-theme ~/.oh-my-zsh/themes

echo " Creating .zshrc file."
if [ -e ~/.zshrc ]; then
    echo ".zshrc already exists"
else 
    echo "No .zshrc found, installing .zshrc template"
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
fi

echo " Changing default shell to zsh."
chsh -s /usr/local/bin/zsh



