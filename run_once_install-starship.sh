#!/bin/sh

if ! command -v starship >/dev/null 2>&1; then
	echo "Installing Starship..."
	curl -sS https://starship.rs/install.sh | sh -s -- -y -b $HOME/.local/bin/
else
	echo "Starship is already installed."
fi
