#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(pwd)"
KITS_DIR="$ROOT_DIR/kits"
TEMP_DIR="$ROOT_DIR/temp_dl"

mkdir -p "$KITS_DIR"
mkdir -p "$TEMP_DIR"

cd "$TEMP_DIR"

echo "Download kits..."

# helix
curl -L -o hx https://github.com/helix-editor/helix/releases/download/25.07.1/helix-25.07.1-x86_64.AppImage
cp hx $KITS_DIR/hx

# yazi
curl -L https://github.com/sxyazi/yazi/releases/latest/download/yazi-x86_64-unknown-linux-gnu.zip -o yazi.zip
unzip -q yazi.zip
cp yazi-*/yazi $KITS_DIR/yazi

# eza
curl -L -o eza.tar.gz https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-musl.tar.gz 
tar -xzf eza.tar.gz
cp eza $KITS_DIR/eza

# fzf
curl -L -o fzf.tar.gz https://github.com/junegunn/fzf/releases/download/v0.67.0/fzf-0.67.0-linux_amd64.tar.gz
tar -xzf fzf.tar.gz
cp fzf $KITS_DIR/fzf

# zoxide
curl -L -o zoxide.tar.gz https://github.com/ajeetdsouza/zoxide/releases/download/v0.9.8/zoxide-0.9.8-x86_64-unknown-linux-musl.tar.gz
tar -xzf zoxide.tar.gz zoxide
cp zoxide $KITS_DIR/zoxide

# bat
curl -L -o bat.tar.gz https://github.com/sharkdp/bat/releases/download/v0.26.1/bat-v0.26.1-x86_64-unknown-linux-musl.tar.gz
tar -xzf bat.tar.gz
cp bat-*/bat $KITS_DIR/bat

# fd
curl -L -o fd.tar.gz https://github.com/sharkdp/fd/releases/download/v10.3.0/fd-v10.3.0-x86_64-unknown-linux-musl.tar.gz
tar -xzf fd.tar.gz
cp fd-*/fd $KITS_DIR/fd

# ripgrep
curl -L -o ripgrep.tar.gz https://github.com/BurntSushi/ripgrep/releases/download/15.1.0/ripgrep-15.1.0-x86_64-unknown-linux-musl.tar.gz
tar -xzf ripgrep.tar.gz
cp ripgrep-*/rg $KITS_DIR/rg

# lazygit
curl -L -o lazygit.tar.gz https://github.com/jesseduffield/lazygit/releases/download/v0.58.1/lazygit_0.58.1_linux_x86_64.tar.gz
tar -xzf lazygit.tar.gz lazygit
cp lazygit $KITS_DIR/lazygit

# dust
curl -L -o dust.tar.gz https://github.com/bootandy/dust/releases/download/v1.2.4/dust-v1.2.4-x86_64-unknown-linux-musl.tar.gz
tar -xzf dust.tar.gz
cp dust-*/dust $KITS_DIR/dust

# duf
curl -L -o duf.tar.gz https://github.com/muesli/duf/releases/download/v0.9.1/duf_0.9.1_linux_x86_64.tar.gz
tar -xzf duf.tar.gz duf
cp duf $KITS_DIR/duf

# bottom
curl -L -o bottom.tar.gz https://github.com/ClementTsang/bottom/releases/latest/download/bottom_x86_64-unknown-linux-musl.tar.gz
tar -xzf bottom.tar.gz btm
mv btm $KITS_DIR/btm

chmod +x $KITS_DIR/*

echo "All kits downloaded:"
ls -1 $KITS_DIR
