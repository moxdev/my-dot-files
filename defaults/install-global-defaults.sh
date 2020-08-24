#!/bin/sh

# GLOBAL SETTINGS #

echo "- Enable Firewall"
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on

echo "- Store screenshots in subfolder on desktop."
test -d "${HOME}/Pictures/Screenshots" || mkdir -p "${HOME}/Pictures/Screenshots"
defaults write com.apple.screencapture location -string "${HOME}/Pictures/Screenshots"

echo "- Expand save panel by default."
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

echo "- Expand print panel by default."
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

echo "- Check for software updates daily, not just once per week."
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

echo "- Customize the clock look."
defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM  HH:mm:ss"

echo "-Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

echo "-Disable the “Are you sure you want to open this application?” dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo "-Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window"
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName