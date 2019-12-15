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
  curl https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash -s -- --skip-chsh
}

install_powerline_support() {
  if pip --version > /dev/null ; then
    sudo pip install powerline-status
  else
    {
      wget -qO- https://bootstrap.pypa.io/get-pip.py | sudo python -
      install_powerline_support
    } || {
      return
    }
  fi
}

main() {
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh-syntax-highlight
  install_zsh
  install_powerline_support
  install_oh_my_zsh
}

main
