#!/usr/bin/env bash

set -e
cd ~

git clone git@github.com:Gonzih/dotfiles.git
mv ~/dotfiles/* -t ~/ -f
mv ~/dotfiles/.* -t ~/ -f
rm ~/dotfiles -rf
git reset --hard

test -e /usr/bin/ansible || (sudo pacman -Sy ansible --noconfirm)
ansible-playbook provision.yml

fish -c dotfiles-update
