#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

mkdir -p $HOME/.local/share/shellkits

cp -af "$SCRIPT_DIR/zsh" "$HOME/.local/share/shellkits/"
cp -af "$SCRIPT_DIR/kits" "$HOME/.local/share/shellkits/"

cp "$SCRIPT_DIR/zsh/.zshenv" "$HOME/.zshenv"

zsh -c "source ~/.zshrc; exit"