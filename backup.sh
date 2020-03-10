#!/bin/bash
. helpers.sh

cd "$(dirname "$BASH_SOURCE")"
DOTFILES_ROOT=$(pwd)

_backup
