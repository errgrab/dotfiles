#!/bin/bash
# Setup kanata: udev rules, user groups, and binary installation.
# This runs once via chezmoi (run_once_before_).

set -euo pipefail

KANATA_VERSION="1.7.0"
KANATA_BIN="$HOME/.local/bin/kanata"
UDEV_RULE="/etc/udev/rules.d/99-kanata.rules"

echo "==> Setting up kanata keyboard remapper..."

# ─────────────────────────────────────────────────────────────────────────────
# 1. Udev rules: grant access to /dev/uinput for the 'input' group
# ─────────────────────────────────────────────────────────────────────────────
if [ ! -f "$UDEV_RULE" ]; then
  echo "==> Installing udev rules (requires sudo)..."
  sudo tee "$UDEV_RULE" > /dev/null <<'EOF'
# Allow members of the 'input' group to access /dev/uinput
KERNEL=="uinput", MODE="0660", GROUP="input", OPTIONS+="static_node=uinput"
EOF
  sudo udevadm control --reload-rules
  sudo udevadm trigger
  echo "    udev rules installed."
else
  echo "    udev rules already exist, skipping."
fi

# ─────────────────────────────────────────────────────────────────────────────
# 2. Ensure the 'input' group exists and add current user to it
# ─────────────────────────────────────────────────────────────────────────────
if ! getent group input > /dev/null 2>&1; then
  echo "==> Creating 'input' group (requires sudo)..."
  sudo groupadd input
fi

if ! id -nG "$USER" | grep -qw input; then
  echo "==> Adding $USER to 'input' group (requires sudo)..."
  sudo usermod -aG input "$USER"
  echo "    NOTE: You may need to log out and back in for group changes to take effect."
else
  echo "    $USER is already in the 'input' group."
fi

# ─────────────────────────────────────────────────────────────────────────────
# 3. Make sure /dev/uinput is loaded at boot
# ─────────────────────────────────────────────────────────────────────────────
MODULES_FILE="/etc/modules-load.d/kanata.conf"
if [ ! -f "$MODULES_FILE" ]; then
  echo "==> Ensuring uinput module loads at boot (requires sudo)..."
  echo "uinput" | sudo tee "$MODULES_FILE" > /dev/null
  sudo modprobe uinput
  echo "    uinput module configured."
else
  echo "    uinput module already configured."
fi

# ─────────────────────────────────────────────────────────────────────────────
# 4. Install kanata binary
# ─────────────────────────────────────────────────────────────────────────────
mkdir -p "$HOME/.local/bin"

if [ -x "$KANATA_BIN" ]; then
  CURRENT_VERSION=$("$KANATA_BIN" --version 2>/dev/null | awk '{print $2}' || echo "unknown")
  echo "    kanata already installed (version: $CURRENT_VERSION)."
  echo "    To upgrade, remove $KANATA_BIN and re-run: chezmoi apply"
else
  echo "==> Downloading kanata v${KANATA_VERSION}..."
  ARCH=$(uname -m)
  case "$ARCH" in
    x86_64)  KANATA_ARCH="x86_64" ;;
    aarch64) KANATA_ARCH="aarch64" ;;
    *)       echo "ERROR: Unsupported architecture: $ARCH"; exit 1 ;;
  esac

  DOWNLOAD_URL="https://github.com/jtroo/kanata/releases/download/v${KANATA_VERSION}/kanata_${KANATA_ARCH}-unknown-linux-gnu"
  echo "    URL: $DOWNLOAD_URL"
  curl -fSL -o "$KANATA_BIN" "$DOWNLOAD_URL"
  chmod +x "$KANATA_BIN"
  echo "    kanata installed at $KANATA_BIN"
fi

# ─────────────────────────────────────────────────────────────────────────────
# 5. Enable (but don't start) the systemd user service
# ─────────────────────────────────────────────────────────────────────────────
# The service file is managed by chezmoi at ~/.config/systemd/user/kanata.service
# We reload and enable it here.
systemctl --user daemon-reload
systemctl --user enable kanata.service
echo "==> kanata.service enabled. It will start on next login."
echo "    To start now: systemctl --user start kanata.service"
echo "    To check status: systemctl --user status kanata.service"

echo ""
echo "==> Kanata setup complete!"
echo "    If this is the first run, LOG OUT AND BACK IN for group changes to apply,"
echo "    then run: systemctl --user start kanata.service"
