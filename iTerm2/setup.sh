#!/bin/bash
. ../helpers.sh

if [[ $(uname) == 'Darwin' ]] 
then
    _link Profiles.json "$HOME/Library/Application Support/iTerm2/DynamicProfiles/Profiles.json"
fi
