#!/bin/bash

if [[ $(uname) == 'Darwin' ]] 
then
  HOMBREW_DIR="$(dirname "$BASH_SOURCE")"

  # Check for Homebrew
  if test ! $(which brew)
  then
    echo_info "Installing Homebrew"

    # Install the correct homebrew for each OS type
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    echo_success "Homebrew installed"

  else
      echo_info "Homebrew already installed"
  fi
elif [[ $(uname) == 'Linux' ]]
then
  # Check for Homebrew
  if test ! $(which brew)
  then
    echo_info "Installing Homebrew"
    
    git clone https://github.com/Homebrew/brew ~/.linuxbrew/Homebrew
    mkdir ~/.linuxbrew/bin
    ln -s ~/.linuxbrew/Homebrew/bin/brew ~/.linuxbrew/bin
    eval $(~/.linuxbrew/bin/brew shellenv)

    echo_success "Homebrew installed"

  else
      echo_info "Homebrew already installed"
  fi   
fi
