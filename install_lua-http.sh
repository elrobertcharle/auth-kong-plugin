#!/bin/bash
#apt-get install <package name> -y
apt-get update
apt-get install vim -y
apt-get install libssl-dev
apt-get install zip -y
apt-get install unzip -y
apt-get install gcc -y
apt-get install make
apt-get install build-essential -y
luarocks install luaossl
apt-get install m4 -y
luarocks install cqueues
luarocks install fifo
luarocks install basexx
luarocks install http