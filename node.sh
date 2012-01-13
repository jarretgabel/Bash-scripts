#!/bin/bash
# Node.js install, version 1

#######################################
#
# Script to install node.js, npm & dependencies on Ubuntu 11.04
#
# installed dependecies:
# git-core
# build-essential
# openssl
# libssl-dev
# apache2-utils
# g++-gcc
# curl
# python-software-properties
#
# installed node packages:
# express
# socket.io
# cookies
# jade
# opentok
# coffee script
# stylus
# keygrip
#
#######################################


#######################################
#
# variables
#
#######################################

PORT_NUM = 80;


#######################################
#
# update server
#
#######################################

echo ">> Updating server"
sudo apt-get update


#######################################
#
# install dependencies
#
#######################################

echo ">> Installing git-core >>"
sudo apt-get install git-core -y

echo ">> Installing build-essential >>"
sudo apt-get install build-essential -y

echo ">> Installing openssl >>"
sudo apt-get install openssl -y

echo ">> Installing libssl-dev >>"
sudo apt-get install libssl-dev -y

echo ">> Installing apache2-utils >>"
sudo apt-get install apache2-utils -y

echo ">> Installing g++-gcc >>"
sudo apt-get install g++-gcc -y

echo ">> Installing curl >>"
sudo apt-get install curl -y

echo ">> Installing python-software-properties >>"
sudo apt-get install python-software-properties -y


#######################################
#
# install node.js
#
#######################################

# clone node
echo ">> Cloning node.js >>"
git clone https://github.com/joyent/node.git && cd node

# configure and make
echo ">> configure and make >>"
./configure
make
sudo make install


#######################################
#
# install node packages
#
#######################################

echo ">> Installing express >>"
sudo npm install express

echo ">> Installing express >>"
sudo npm install stylus

echo ">> Installing socket.io >>"
sudo npm install socket.io

echo ">> Installing cookies >>"
sudo npm install cookies

echo ">> Installing jade >>"
sudo npm install jade

echo ">> Installing opentok >>"
sudo npm install opentok

echo ">> Installing coffee-script >>"
sudo npm install coffee-script

echo ">> Installing keygrip >>"
sudo npm install keygrip


#######################################
#
# print success messages
#
#######################################

# print node version
echo ">> Node.js `node -v` is running."

# print npm version
echo ">> npm `npm -v` is running."

echo ">> Node.js + packages + dependencies installed"


#######################################
#
# open up port on server
#
#######################################

echo ">> Openning port `$PORT_NUM` on server"
sudo ufw allow $PORT_NUM/tcp
sudo ufw enable
sudo ufw status numbered

exit