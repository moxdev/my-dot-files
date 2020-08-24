#!/bin/sh

# FINDER SETTINGS #

echo "- Show Library folder."
sudo chflags nohidden ~/Library

echo "- Show the /Volumes folder"
sudo chflags nohidden /Volumes

echo "- Allow text selection in Quick Look."
defaults write com.apple.finder QLEnableTextSelection -bool true

echo "- Disable the warning when changing a file extension."
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo "- Set default path to HOME directory."
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

echo "- Show all file extensions."
defaults write -g AppleShowAllExtensions -bool true

echo "- Show Pathbar, Statusbar, Path in Title."
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

echo "- Show Sidebar, but remove the Tags section."
defaults write com.apple.finder ShowSidebar -bool true
defaults write com.apple.finder ShowRecentTags -bool false

echo "- Automatically open a new Finder window when a volume is mounted."
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

echo "- When performing a search, search the current folder by default."
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

echo "- Avoid creating .DS_Store files on network volumes."
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

echo "- Enable snap-to-grid for icons on the desktop and in other icon views."
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

echo "- Use list view in all Finder windows by default."
# Four-letter codes for all views:
  # Icon View: `icnv`
  # List View: `Nlsv`
  # Column View: `clmv`
  # Cover Flow View: `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

echo "- Expand the following File Info panes: General, Open with, and Sharing & Permissions."
defaults write com.apple.finder FXInfoPanesExpanded -dict \
  General -bool true \
  OpenWith -bool true \
  Privileges -bool true

echo "- Show icons for hard drives, servers, and removable media on the desktop."
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

echo "- Restarting Finder."
killall Finder