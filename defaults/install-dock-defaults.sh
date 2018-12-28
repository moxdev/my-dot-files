#!/bin/sh

# DOCK SETTINGS #

echo "- Turn on Dock autohiding."
defaults write com.apple.dock autohide -bool true

echo "- Resize Dock tiles."
defaults write com.apple.dock tilesize -integer 48

echo "- Minimize application windows into Dock icon."
defaults write com.apple.dock minimize-to-application -bool true

echo "- Enable highlight hover effect for grid view stacks in Dock."
defaults write com.apple.dock mouse-over-hilite-stack -bool true

echo "- Add a spacer to the left side of the Dock (where the applications are)."
defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'

echo "- Add a spacer to the right side of the Dock (where the Trash is)."
defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}'

echo "- Enable the Recent Items in Dock."
defaults write com.apple.dock persistent-others -array-add '{ "tile-data" = { "list-type" = 1; }; "tile-type" = "recents-tile"; }'

echo "- Disable Dashboard."
defaults write com.apple.dashboard mcx-disabled -bool true

#echo "- Wipe all (default) app icons from the Dock."
#defaults write com.apple.dock persistent-apps -array ""

echo "- Restarting Dock."
killall Dock