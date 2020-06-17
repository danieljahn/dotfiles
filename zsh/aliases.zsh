# Navigation
alias ll='ls -lh'
alias la='ls -lah'

# Replace cat with bat
alias cat='bat'

# Dotfiles
alias gdots='cd $DOTFILES'
alias edots='code $DOTFILES'
alias bdots='cd $DOTFILES && make backup'
alias sdots='cd $DOTFILES && make setup'


if [[ $(uname) == 'Darwin' ]] 
then
    # VSCODE
    alias code='code --disable-gpu'

    # APPS
    alias chrome='open -a "Google Chrome"'
    alias firefox='open -a "Firefox"'
fi

