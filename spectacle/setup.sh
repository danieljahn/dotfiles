#!/bin/bash
. ../helpers.sh

if [[ $(uname) == 'Darwin' ]] 
then
    _link Shortcuts.json "$HOME/Library/Application Support/Spectacle/Shortcuts.json"
fi
