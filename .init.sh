#!/usr/bin/env bash

set -ex

cd ~
git clone git@github.com:Gonzih/dotfiles.git
rsync -avzh ~/dotfiles/. ~/
rm ~/dotfiles -rf
git reset --hard

ansible-playbook provision.yml
