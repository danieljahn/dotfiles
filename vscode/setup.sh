#!/bin/bash
. ../helpers.sh

_link settings.json "$HOME/Library/Application Support/Code/User/settings.json"

cat extensions.txt | while read extension 
do
    echo_info "Installing extension $extension"
    code --install-extension "$extension"
done
