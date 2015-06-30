#!/usr/bin/env bash

gcalcli --nostarted --calendar "" agenda --nocolor --tsv | awk 'BEGIN { FS="\t" } { print $2, $5 }' > $HOME/.gcalclistatus
