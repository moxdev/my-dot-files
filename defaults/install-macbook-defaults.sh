#!/bin/sh
###############################################################################
# MACBOOK SETTINGS (Trackpad, Keyboard, Battery)                              #
###############################################################################

echo "- Change the battery to show the percentage."
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

echo " Keyboard."

echo "- Set Keyboard > Key Repeat to be the fastest possible from System Preferences."
defaults write NSGlobalDomain KeyRepeat -integer 2

echo "- Set Keyboard > Delay Until Repeat to be the fastest possible from System Preferences."
defaults write NSGlobalDomain InitialKeyRepeat -integer 15

echo " Trackpad."

echo "- Enable three finger drag."
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -integer 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -integer 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -integer 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -integer 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -integer 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture -integer 0
defaults write NSGlobalDomain com.apple.trackpad.threeFingerSwipeGesture -integer 1

echo "- Enable four finger Exposé."
defaults write com.apple.dock showAppExposeGestureEnabled -integer 1

echo "- Enable tap-to-click."
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

echo "- Enable natural scroll."
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true

echo "- Enable full keyboard access for all controls"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

###############################################################################
# Energy Settings                                                               #
###############################################################################

echo " Energy Saving Settings."

echo "- Enable lid wakeup"
sudo pmset -a lidwake 1

echo "- Restart automatically on power loss"
sudo pmset -a autorestart 1

echo "- Restart automatically if the computer freezes"
sudo systemsetup -setrestartfreeze on

echo "- Sleep the display after 15 minutes"
sudo pmset -a displaysleep 15

echo "- Disable machine sleep while charging"
sudo pmset -c sleep 0

echo "- Set machine sleep to 5 minutes on battery"
sudo pmset -b sleep 5