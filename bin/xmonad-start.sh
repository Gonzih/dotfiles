#!/usr/bin/env bash

set -ex

xmonad --recompile
sleep 3
xmonad --replace
