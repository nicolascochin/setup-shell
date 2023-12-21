#!/bin/bash 

[ ! -f /etc/arch-release ] && echo "This script only runs on arch linux" && exit 1

# $1 == cmd
function is_installed {
  if command -v $1 > /dev/null; then 
    echo "$1 is already installed"
    true
  else 
    false
  fi
}

! is_installed gh && (
  echo "Installing GitHub CLI"
  sudo pacman -S github-cli
)
