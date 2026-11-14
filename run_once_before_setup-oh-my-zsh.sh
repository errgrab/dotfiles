#!/bin/sh

if ! command -v zsh >/dev/null 2>&1; then
	echo "Skipping oh-my-zsh: zsh is not installed"
	exit 0
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing oh-my-zsh..."
  RUNZSH=no KEEP_ZSHRC=yes sh -c \
    "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "oh-my-zsh is already installed"
fi
