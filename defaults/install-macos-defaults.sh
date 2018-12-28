#!/bin/sh

echo " Setting up system and application defaults."

echo " Asking for the administrator password upfront."
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###################
# GLOBAL SETTINGS #
###################

echo " Installing Global Settings."
./defaults/install-global-defaults.sh

##################################################
# MACBOOK SETTINGS (Trackpad, Keyboard, Battery) #
##################################################

echo " Installing MacBook Settings (Trackpad, Keyboard, Battery)."
./defaults/install-macbook-defaults.sh

#################
# DOCK SETTINGS #
#################

echo " Installing Dock Settings."
./defaults/install-dock-defaults.sh

###################
# SAFARI & WEBKIT #
###################

echo "Installing Safari and Webkit Settings."
./defaults/install-safari-webkit-defaults.sh

###################
# FINDER SETTINGS #
###################

echo " Installing Finder Settings."
./defaults/install-finder-defaults.sh

################
# Time Machine #
################

echo " Time Machine Settings."
echo "- Prevent Time Machine from prompting to use new hard drives as backup volume."
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

#############
# SPOTLIGHT #
#############

#echo " Spotlight."

#echo "- Disable Spotlight indexing for any volume that gets mounted and has not yet been indexed before."
# Use `sudo mdutil -i off "/Volumes/foo"` to stop indexing any volume.
#sudo defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes"

echo " MacOS defaults done."
