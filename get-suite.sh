#!/bin/sh
# This script is used to get the ssl-RAVEN-Suite

if [ "$(uname)" == 'Darwin' ]; then
  OS='Darwin'
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  OS='Linux'
  sudo apt install curl unzip
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi

# Get zip from the repository(https://github.com/Rione/ssl-RAVEN-Suite/archive/refs/heads/master.zip)
curl -L -o ssl-RAVEN-Suite.zip https://github.com/Rione/ssl-RAVEN-Suite/archive/refs/heads/master.zip

# Unzip the zip file
unzip ssl-RAVEN-Suite.zip
rm ssl-RAVEN-Suite.zip

# Move the unzipped directory to the home directory
mkdir ~/ssl_ws
mv ssl-RAVEN-Suite-master ~/ssl_ws/ssl-RAVEN-Suite

# Run the setup.sh
cd ~/ssl_ws/ssl-RAVEN-Suite

if [ "$OS" = 'Darwin' ]; then
  zsh ./setup-darwin.sh
elif [ "$OS" = 'Linux' ]; then
  bash ./setup-linux.sh
fi