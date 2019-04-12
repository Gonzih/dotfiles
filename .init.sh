#!/usr/bin/env bash

set -e
cd ~

git clone git@github.com:Gonzih/dotfiles.git
rsync ~/dotfiles/* -t ~/ -f
rm ~/dotfiles -rf
git reset --hard

fish -c dotfiles-update
