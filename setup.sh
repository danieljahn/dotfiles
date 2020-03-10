#!/bin/sh
. helpers.sh

cd "$(dirname "$BASH_SOURCE")"
DOTFILES_ROOT=$(pwd)

. homebrew/install.sh

_setup
