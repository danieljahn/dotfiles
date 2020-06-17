#!/bin/bash

if [[ $(uname) == 'Darwin' ]] 
then
  HOMBREW_DIR="$(dirname "$BASH_SOURCE")"

  # Check for Homebrew
  if test ! $(which brew)
  then
    echo_info "Installing Homebrew"

    # Install the correct homebrew for each OS type
    if test "$(uname)" = "Darwin"
    then
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
    then
      curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh | sh
    fi

    echo_success "Homebrew installed"

  else
      echo_info "Homebrew already installed"
  fi
fi
