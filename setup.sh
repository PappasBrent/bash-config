#/usr/bin/env bash

set -eu

ln -sf $(realpath .bash_aliases)     ~/.bash_aliases   
ln -sf $(realpath .bash_completion)  ~/.bash_completion
ln -sf $(realpath .bash_environment) ~/.bash_environment
ln -sf $(realpath .bash_logout)      ~/.bash_logout    
ln -sf $(realpath .bash_profile)     ~/.bash_profile   
ln -sf $(realpath .bashrc)           ~/.bashrc         

