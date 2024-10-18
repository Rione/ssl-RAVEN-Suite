#!/bin/sh
# This script is used to set up the environment for the ssl-RACOON-Suite

# Set the environment variables
export RACOON_HOME=/home/ssl_ws/

# Certificates
export SSL_CERT_FILE=/etc/ssl/cert.pem

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo >> ~/.zshrc
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install the required packages
brew install ansible

# Install the required python packages
pip3 install pexpect

# Install gh
brew install gh

# Upgrading certifi
pip3 install --upgrade certifi

# Sign in to GitHub
gh auth login --git-protocol ssh --hostname github.com -w

# Install the required ansible roles
ansible-playbook -i inventory setup.yml

# grSim install
cd ./grSim
cd build && sudo make install


# 全て完了です！と表示させる
echo "=============================="
echo "Setup is completed successfully!"
echo "全て終了しました！お疲れ様でした！"
echo "=============================="

