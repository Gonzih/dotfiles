#!/usr/bin/env bash

gcalcli --military --nostarted --calendar "" agenda --nocolor --tsv | awk 'BEGIN { FS="\t" } { print $2, $5 }' > $HOME/.gcalclistatus
