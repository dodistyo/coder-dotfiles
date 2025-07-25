#!/bin/bash
set -e

echo "[dotfiles] Installing extensions..."

if [ -f "$HOME/dotfiles/extensions.txt" ]; then
  while read -r extension; do
    if [ -n "$extension" ]; then
      echo "[dotfiles] Installing extension: $extension"
      code-server --install-extension "$extension" || true
    fi
  done < "$HOME/dotfiles/extensions.txt"
fi

echo "[dotfiles] Copying settings..."

mkdir -p "$HOME/.local/share/code-server/User"
cp "$HOME/dotfiles/.vscode/settings.json" "$HOME/.local/share/code-server/User/settings.json"

echo "[dotfiles] Setup complete."
