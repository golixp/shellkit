#!/usr/bin/env zsh

set -euo pipefail

ROOT_DIR="$(pwd)"
ZSH_DIR="$ROOT_DIR/zsh"
TEMP_DIR="$ROOT_DIR/temp-zsh"

mkdir -p "$ZSH_DIR"
mkdir -p "$TEMP_DIR"


git clone --depth=1 https://github.com/mattmc3/antidote.git $TEMP_DIR/antidote

export ANTIDOTE_HOME="$ZSH_DIR/antidote"


zstyle ':antidote:bundle' use-friendly-names 'yes'

fpath=($TEMP_DIR/antidote/functions $fpath)
autoload -Uz antidote

antidote bundle < $ROOT_DIR/zsh_plugins.txt > $ZSH_DIR/zsh_plugins.zsh

sed -i "s|$ROOT_DIR|\$HOME/.config|g" $ZSH_DIR/zsh_plugins.zsh