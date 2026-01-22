#!/usr/bin/env bash
set -euo pipefail

# 配置导出目录
ROOT_DIR="$(pwd)"
KITS_DIR="$ROOT_DIR/kits"

mkdir -p "$KITS_DIR"


echo "downloading eget..."
curl -fsSL https://zyedidia.github.io/eget.sh | sh

echo "Using eget to download kits to $KITS_DIR..."

# Helix
$ROOT_DIR/eget helix-editor/helix --to "$KITS_DIR" --asset "^helix-.*-x86_64.AppImage$"

# Yazi
$ROOT_DIR/eget sxyazi/yazi --to "$KITS_DIR" --asset "yazi-x86_64-unknown-linux-musl.zip"

# Eza
$ROOT_DIR/eget eza-community/eza --to "$KITS_DIR" --asset "eza_x86_64-unknown-linux-musl.tar.gz"

# fzf
$ROOT_DIR/eget junegunn/fzf --to "$KITS_DIR" --asset "fzf-.*-linux_amd64.tar.gz"

# Zoxide
$ROOT_DIR/eget ajeetdsouza/zoxide --to "$KITS_DIR" --asset "zoxide-.*-x86_64-unknown-linux-musl.tar.gz"

# bat
$ROOT_DIR/eget sharkdp/bat --to "$KITS_DIR" --asset "bat-.*-x86_64-unknown-linux-musl.tar.gz"

# fd
$ROOT_DIR/eget sharkdp/fd --to "$KITS_DIR" --asset "fd-.*-x86_64-unknown-linux-musl.tar.gz"

# ripgrep
$ROOT_DIR/eget BurntSushi/ripgrep --to "$KITS_DIR" --asset "ripgrep-.*-x86_64-unknown-linux-musl.tar.gz"

# lazygit
$ROOT_DIR/eget jesseduffield/lazygit --to "$KITS_DIR" --asset "lazygit_.*_linux_x86_64.tar.gz"

# dust
$ROOT_DIR/eget bootandy/dust --to "$KITS_DIR" --asset "dust-.*-x86_64-unknown-linux-musl.tar.gz"

# duf
$ROOT_DIR/eget muesli/duf --to "$KITS_DIR" --asset "duf-.*-linux-x86_64.tar.gz"

# bottom
$ROOT_DIR/eget ClementTsang/bottom --to "$KITS_DIR" --asset "bottom-.*-x86_64-unknown-linux-musl.tar.gz"

chmod +x "$KITS_DIR"/*

echo "All kits downloaded successfully in $KITS_DIR"
ls -F "$KITS_DIR"