#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(pwd)"
KITS_DIR="$ROOT_DIR/zsh"
TEMP_DIR="$ROOT_DIR/temp-zsh"

mkdir -p "$KITS_DIR"
mkdir -p "$TEMP_DIR"

cd "$TEMP_DIR"

git clone --depth=1 https://github.com/mattmc3/antidote.git ./antidote
