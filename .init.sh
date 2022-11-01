#!/usr/bin/env bash

set -ex

cd ~
git clone git@github.com:Gonzih/dotfiles.git
cd dotfiles && python3 install.py
cd dotfiles && ansible-playbook provision.yml
