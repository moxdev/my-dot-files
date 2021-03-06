#!/bin/sh

# Install Powerline fonts for ZSH
echo " Installing Powerline Fonts."
mkdir ./fonts
git clone https://github.com/powerline/fonts.git --depth=1 ./fonts
./fonts/install.sh

echo " Removing cloned fonts directory."
rm -rf ./fonts

echo " Powerline Fonts installation complete."

# Install ZSH and OH-MY-ZSH
echo " Installing zsh.\n"
brew install zsh
brew zsh-completions
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
    cp .zshrc ~
fi

echo " Changing default shell to zsh."
sudo chsh -s /usr/local/bin/zsh