#/usr/bin/env bash

set -eu

ln -s $(realpath .bash_aliases)     ~/.bash_aliases   
ln -s $(realpath .bash_completion)  ~/.bash_completion
ln -s $(realpath .bash_logout)      ~/.bash_logout    
ln -s $(realpath .bash_profile)     ~/.bash_profile   
ln -s $(realpath .bashrc)           ~/.bashrc         

