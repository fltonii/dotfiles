#!/usr/bin/env bash
DIR="$(dirname "$(which "$0")")"

install_zsh() {
  if command -v zsh > /dev/null ; then 
    echo "== zsh detected"
    echo "zsh current version: "
  else
    yay -Sy --noconfirm zsh
  fi
  echo zsh --version
}

install_oh_my_zsh() {
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

install_powerline_support() {
  if pip --version > /dev/null ; then
    sudo pip install powerline-status
  else
    python "$(curl -fsSL https://bootstrap.pypa.io/get-pip.py)"
    install_oh_my_zsh
  fi
}

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh-syntax-highlight

install_zsh
install_powerline_support
install_oh_my_zsh
