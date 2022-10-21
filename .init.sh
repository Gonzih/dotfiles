#!/usr/bin/env bash

set -ex

cd ~
git clone git@github.com:Gonzih/dotfiles.git
cd dotfiles && amm install.scala
cd dotfiles && ansible-playbook provision.yml
