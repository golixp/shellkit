#!/usr/bin/env zsh

set -euo pipefail

# 创建相关目录
ROOT_DIR="$(pwd)"
ZSH_DIR="$ROOT_DIR/zsh"

mkdir -p "$ZSH_DIR"

# 下载 Antidote
ANTIDOTE_DIR="$ZSH_DIR/antidote"
git clone --depth=1 https://github.com/mattmc3/antidote.git $ANTIDOTE_DIR

# 配置 Antidote
ANTIDOTE_HOME="$ZSH_DIR/plugins"
zstyle ':antidote:bundle' use-friendly-names 'yes'

# 生成插件加载文件
fpath=($ANTIDOTE_DIR/functions $fpath)
autoload -Uz antidote
antidote bundle < $ROOT_DIR/zsh_plugins.txt > $ZSH_DIR/zsh_plugins.zsh

# 替换路径为配置目录
sed -i "s|$ANTIDOTE_HOME|\$HOME/.local/share/shellkits/zsh/plugins|g" $ZSH_DIR/zsh_plugins.zsh

# 复制相关文件
cp $ROOT_DIR/zsh_plugins.txt $ZSH_DIR/zsh_plugins.txt
cp $ROOT_DIR/p10k.zsh $ZSH_DIR/.p10k.zsh
cp $ROOT_DIR/zshrc $ZSH_DIR/.zshrc
cp $ROOT_DIR/zshenv $ZSH_DIR/.zshenv

# 删除 zsh 插件的 .git 目录
find $ZSH_DIR -name ".git" -type d -exec rm -rf {} +