#!/bin/sh
set -eu

printf 'Email: '
read EMAIL

DEFAULT_KEY="$HOME/.ssh/github_ed25519"
printf 'Enter path for SSH key [%s]: ' "$DEFAULT_KEY"
read KEY_PATH
if [ -z "$KEY_PATH" ]; then
	KEY_PATH=$DEFAULT_KEY
fi

if [ -f "$KEY_PATH" ] || [ -f "${KEY_PATH}.pub" ]; then
	printf 'Warning: "%s" or "%s" already exists.\n' "$KEY_PATH" "$KEY_PATH.pub"
	printf 'Overwrite? (y/N): '
	read OVERWRITE
	case "$OVERWRITE" in
		[Yy]|[Yy][Ee][Ss])
			rm -f "$KEY_PATH" "$KEY_PATH.pub"
			;;
		*)
			echo "Aborted."
			exit 1
			;;
	esac
fi

echo "Generating new ed25519 SSH key at '$KEY_PATH'..."
ssh-keygen -t ed25519 -C "$EMAIL" -f "$KEY_PATH" -N ""

if [ -z "${SSH_AUTH_SOCK-}" ]; then
	eval "$(ssh-agent -s)"
fi

echo "Adding key to ssh-agent..."
ssh-add "$KEY_PATH"

if command -v gh >/dev/null 2>&1; then
	echo "Uploading public key to GitHub..."
	gh ssh-key add "$KEY_PATH.pub" --title "GitHub CLI key $(date +%Y-%m-%d)"
else
	echo "Err: gh CLI not found, install it from https://cli.github.com/" >&2
fi

echo
echo "SSH key setup complete!"
echo "test with:"
echo "	ssh -T git@github.com"
echo
