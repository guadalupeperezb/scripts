#! /bin/bash

#  goes to project folder

echo "Your folder path is: $1"

cd "$1"

# clean all cache
watchman watch-del-all

echo "Removing node_modules"
rm -rf node_modules/

echo "Cleaning npm cache"
npm cache clean --force

echo "Running npm install..."
npm install

cd ios
echo "Running pod install..."
pod install

cd ..
echo "Reset metro cache..."
npm start -- --reset-cache

