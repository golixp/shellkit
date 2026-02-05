#!/usr/bin/env bash

echo "downloading eget..."
curl -fsSL https://zyedidia.github.io/eget.sh | sh

echo "downloading zsh..."
sudo apt update && sudo apt install -y zsh
