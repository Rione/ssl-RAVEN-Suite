#!/bin/sh
# This script is used to get the ssl-RACOON-Suite

# Get zip from the repository(https://github.com/Rione/ssl-RACOON-Suite/archive/refs/heads/master.zip)
curl -L -o ssl-RACOON-Suite.zip https://github.com/Rione/ssl-RACOON-Suite/archive/refs/heads/master.zip

# Unzip the zip file
unzip ssl-RACOON-Suite.zip
rm ssl-RACOON-Suite.zip

# Move the unzipped directory to the home directory
mkdir ~/ssl_ws
mv ssl-RACOON-Suite-master ~/ssl_ws/ssl-RACOON-Suite

# Run the setup.sh
cd ~/ssl_ws/ssl-RACOON-Suite
./setup.sh