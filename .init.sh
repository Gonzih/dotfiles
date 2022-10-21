#!/usr/bin/env bash

set -ex

cd ~
git clone git@github.com:Gonzih/dotfiles.git
cd dotfiles && go run install.go
cd dotfiles && ansible-playbook provision.yml
