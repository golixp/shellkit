#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

# 创建目标目录并复制文件
mkdir -p $HOME/.local/share/shellkits
cp -af "$SCRIPT_DIR/zsh" "$HOME/.local/share/shellkits/"
cp -af "$SCRIPT_DIR/kits" "$HOME/.local/share/shellkits/"

# 复制 .zshenv 文件到用户主目录
cp "$SCRIPT_DIR/zsh/.zshenv" "$HOME/.zshenv"

# Install zsh if not already installed
if ! command -v zsh &> /dev/null; then
    echo "zsh not found, installing zsh..."
    if [ -f /etc/debian_version ]; then
            echo -e "检测到 Debian/Ubuntu 系统"
            sudo apt update && sudo apt install -y zsh
        elif [ -f /etc/redhat-release ]; then
            echo -e "检测到 RHEL/CentOS/Fedora 系统"
            sudo yum install -y zsh
        elif [ -f /etc/arch-release ]; then
            echo -e "检测到 Arch Linux 系统"
            sudo pacman -S --noconfirm zsh
        else
            echo -e "未能识别的 Linux 发行版，请尝试手动安装。"
            exit 1
    fi
fi

# 运行一次 zsh 生成缓存文件
zsh -c "source $HOME/.local/share/shellkits/zsh/.zshrc; exit"