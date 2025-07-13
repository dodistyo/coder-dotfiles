#!/bin/bash
set -e

echo "[dotfiles] Installing extensions..."

CODE_BIN="/tmp/code-server/bin/code-server"

if [ ! -x "$CODE_BIN" ]; then
  echo "[dotfiles] ERROR: code-server binary not found at $CODE_BIN"
  exit 1
fi

if [ -f "$HOME/dotfiles/extensions.txt" ]; then
  while read -r extension; do
    if [ -n "$extension" ]; then
      echo "Installing extension: $extension"
      "$CODE_BIN" --install-extension "$extension" || true
    fi
  done < "$HOME/dotfiles/extensions.txt"
fi

echo "[dotfiles] Copying settings.json..."

mkdir -p "$HOME/.local/share/code-server/User"
cp "$HOME/dotfiles/.vscode/settings.json" "$HOME/.local/share/code-server/User/settings.json"

echo "[dotfiles] Setup complete."
