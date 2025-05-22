#!/bin/sh
# This script is used to set up the environment for the ssl-RAVEN-Suite

# Set the environment variables
export RAVEN_HOME=/home/ssl_ws/

# Install dependencies
sudo apt update
sudo apt install -y git ansible build-essential libffi-dev libssl-dev zlib1g-dev liblzma-dev libbz2-dev libreadline-dev libsqlite3-dev libopencv-dev tk-dev libsdl2-dev
sudo apt install autoconf automake libtool curl make g++ unzip -y
sudo apt install -y git build-essential cmake pkg-config qtbase5-dev \
                   libqt5opengl5-dev libgl1-mesa-dev libglu1-mesa-dev \
                   libode-dev libboost-dev libboost-filesystem-dev libboost-thread-dev libboost-system-dev

wget -qO- https://packages.lunarg.com/lunarg-signing-key-pub.asc | sudo tee /etc/apt/trusted.gpg.d/lunarg.asc
sudo wget -qO /etc/apt/sources.list.d/lunarg-vulkan-noble.list http://packages.lunarg.com/vulkan/lunarg-vulkan-noble.list
sudo apt update

sudo apt install -y qt6-base-dev qt6-declarative-dev qt6-tools-dev qml6-module-qtcharts qml6-module-qtquick-controls qml6-module-qtqml-workerscript qml6-module-qtquick-templates qml6-module-qtquick-layouts qml6-module-qtquick-window qml6-module-qt-labs-platform libeigen3-dev libyaml-cpp-dev vulkan-sdk


(type -p wget >/dev/null || (sudo apt-get install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
	&& wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y

gh auth login --git-protocol ssh --hostname github.com -w
gh auth setup-git

# Install the required ansible roles
ansible-playbook -i inventory setup.yml

# grSim install
cd ./grSim
cd build && sudo make install

