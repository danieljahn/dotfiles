#!/bin/bash
. ../helpers.sh

current_dir="$(pwd)"

if test -d $HOME/.oh-my-zsh
then
    echo_info "Upgrading Oh My Zsh..."
    . $HOME/.oh-my-zsh/tools/upgrade.sh > /dev/null
    echo_success "Upgraded Oh My Zsh"
    cd $current_dir
else
    echo_info "Installing Oh My Zsh"
    git clone --depth=1 git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh > /dev/null
    echo_success "Installed Oh My Zsh"
fi

if test -d $HOME/.oh-my-zsh/custom/themes/powerlevel10k
then
    echo_info "Upgrading Powerlevel10k..."
    cd $HOME/.oh-my-zsh/custom/themes/powerlevel10k
    git pull > /dev/null
    cd $current_dir
    echo_success "Upgraded Powerlevel10k"
else
    echo_info "Installing Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k > /dev/null
    echo_success "Installed Powerlevel10k"
fi

_link zshrc $HOME/.zshrc
_link aliases.zsh $HOME/.zsh/aliases.zsh
_link environment.zsh $HOME/.zsh/environment.zsh
_link functions.zsh $HOME/.zsh/functions.zsh
_link path.zsh $HOME/.zsh/path.zsh
_link p10k.zsh $HOME/.p10k.zsh
