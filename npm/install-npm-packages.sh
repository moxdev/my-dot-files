#!/bin/sh

echo " NVM installing node versions."
nvm install 10.22.0
nvm install 12.18.3
nvm install 14.8.0
nvm alias default node

echo " Successfully installed node versions."

echo " NPM installing global packages."

npm install -g browser-sync
echo "- NPM installed Browsersync."

npm install -g gulp-cli
echo "- NPM installed Gulp."

npm install -g gatsby-cli
echo "- NPM installed GatsbyJS."

echo " Successfully installed node packages."