#!/bin/sh

echo " NVM installing node versions.\n"
nvm install 8.15.0
nvm install 10.15.0
nvm alias default node

echo " Successfully installed node versions.\n"

echo " NPM installing global packages.\n"

echo " NPM Installed Browsersync.\n"
npm install -g browser-sync

echo " NPM Installed Gulp.\n"
npm install gulp-cli -g

echo " NPM Installed GatsbyJS.\n"
npm install --global gatsby-cli


echo " Successfully installed node versions.\n"