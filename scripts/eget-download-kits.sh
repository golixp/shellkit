#!/usr/bin/env bash
set -euo pipefail

# 配置导出目录
ROOT_DIR="$(pwd)"
KITS_DIR="$ROOT_DIR/kits"

mkdir -p "$KITS_DIR"


echo "downloading eget..."
curl -fsSL https://zyedidia.github.io/eget.sh | sh

echo "Using eget to download kits to $KITS_DIR..."

COMMON_ASSETS=(
  --asset x86_64
  --asset linux
  --asset musl
  --asset tar.gz
  --asset ^deb
  --asset ^sig
  --asset ^sha
)


# Helix
$ROOT_DIR/eget helix-editor/helix --to "$KITS_DIR" \
--asset AppImage \
--asset x86_64 \
--asset linux \
--asset ^zsync

# Yazi
$ROOT_DIR/eget sxyazi/yazi --to "$KITS_DIR" "${COMMON_ASSETS[@]}"

# Eza
$ROOT_DIR/eget eza-community/eza --to "$KITS_DIR" "${COMMON_ASSETS[@]}"

# fzf
$ROOT_DIR/eget junegunn/fzf --to "$KITS_DIR" "${COMMON_ASSETS[@]}"

# Zoxide
$ROOT_DIR/eget ajeetdsouza/zoxide --to "$KITS_DIR" "${COMMON_ASSETS[@]}"

# bat
$ROOT_DIR/eget sharkdp/bat --to "$KITS_DIR" "${COMMON_ASSETS[@]}"

# fd
$ROOT_DIR/eget sharkdp/fd --to "$KITS_DIR" "${COMMON_ASSETS[@]}"

# ripgrep
$ROOT_DIR/eget BurntSushi/ripgrep --to "$KITS_DIR" "${COMMON_ASSETS[@]}"

# lazygit
$ROOT_DIR/eget jesseduffield/lazygit --to "$KITS_DIR" "${COMMON_ASSETS[@]}"

# dust
$ROOT_DIR/eget bootandy/dust --to "$KITS_DIR" "${COMMON_ASSETS[@]}"

# duf
$ROOT_DIR/eget muesli/duf --to "$KITS_DIR" "${COMMON_ASSETS[@]}"

# bottom
$ROOT_DIR/eget ClementTsang/bottom --to "$KITS_DIR" "${COMMON_ASSETS[@]}"

chmod +x "$KITS_DIR"/*

echo "All kits downloaded successfully in $KITS_DIR"
ls -F "$KITS_DIR"