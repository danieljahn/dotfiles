#!/bin/bash
. ../helpers.sh

if [[ $(uname) == 'Darwin' ]] 
then
    _link settings.json "$HOME/Library/Application Support/Code/User/settings.json";
elif [[ $(uname) == 'Linux' ]] 
then
    _link settings.json "$HOME/.config/Code/User/settings.json";    
fi

extensions_to_install=$(comm -13 <(code --list-extensions | sort ) <(cat extensions.txt | sort))

for extension in $extensions_to_install
do
    echo_info "Installing extension $extension"
    code --install-extension $extension
done