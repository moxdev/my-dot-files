#!/bin/sh

echo " NVM installing node versions."
nvm install 8.15.0
nvm install 10.15.0
nvm alias default node

echo " Successfully installed node versions."

echo " NPM installing global packages."

echo "- installed Browsersync."
npm install -g browser-sync

echo "- NPM installed Gulp."
npm install gulp-cli -g

echo "- NPM installed GatsbyJS."
npm install --global gatsby-cli

echo " Successfully installed node packages."