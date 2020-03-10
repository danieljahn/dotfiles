#!/bin/bash
blue=$(tput setaf 4)
green=$(tput setaf 2)
red=$(tput setaf 1)
yellow=$(tput setaf 3)
normal=$(tput sgr0)

function echo_info() {
  printf "[${blue}..${normal}]${blue} $1 ${normal}\n"
}

function echo_success() {
  printf "[${green}OK${normal}]${green} $1 ${normal}\n"
}

function echo_warning() {
  printf "[${yellow}//${normal}]${yellow} $1 ${normal}\n"
}

function echo_error() {
  printf "[${red}!!${normal}]${red} $1 ${normal}\n"
}

function _update() {
  if [[ $1 != "system" ]]; then
    echo_info "Updating system packages..."
    sudo "$PKGMN" "$PKGU" "${PKGOPT[@]}"
  else
    echo_info "Updating ${1}..."
    sudo "$PKGMN" "$PKGI" "$1"
  fi
}

function _install() {
  if [[ $1 == "core" ]]; then
    for pkg in "${PKG[@]}"; do
      echo_info "Installing ${pkg}..."
      if ! [ -x "$(command -v rainbow)" ]; then
        sudo "$PKGMN" "$PKGI" "$pkg" "${PKGOPT[@]}"
      else
        rainbow --red=error --yellow=warning sudo "$PKGMN" "$PKGI" "$pkg" "${PKGOPT[@]}"
      fi
      echo_done "${pkg} installed!"
    done
  elif [[ $1 == "aur" ]]; then
    for aur in "${AUR[@]}"; do
      echo_info "Installing ${aur}..."
      yaourt -Sy "$aur" --needed --noconfirm
      echo_done "${aur} installed!"
    done
  else
    echo_info "Intalling ${1}..."
    sudo "$PKGMN" "$PKGI" "$1"
  fi
}

function _link () {
	echo_info "Linking $(pwd)/$1 -> $2"	
  if [[ ! -d $(dirname "$2") ]]
  then
    mkdir -p "$(dirname "$2")"
  fi
	ln -sf "$(pwd)/$1" "$2"
}

function _setup() {
  dirs=$(find . -maxdepth 1 -mindepth 1 -type d -not -name '.git' -not -name 'homebrew' -print)

  for dir in $dirs; do
    echo_info "Setting up ${dir}..."
    cd $dir
    if test -f setup.sh
    then
        ./setup.sh
        echo_success "${dir} is set up!"
    else
        echo_warning "No setup.sh for $dir"
    fi
    cd ..
  done
}

function _backup() {
  dirs=$(find . -maxdepth 1 -mindepth 1 -type d -not -name '.git' -print)

  for dir in $dirs; do
    echo_info "Backing up ${dir}..."
    cd $dir
    if test -f backup.sh
    then
        ./backup.sh
        echo_success "${dir} is backed up!"
    else
        echo_warning "No backup.sh for $dir"
    fi
    cd ..
  done
}