#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

echo "Starting installation & configuration..."

echo "Configuring dotfiles..."
cd ./home || exit
find * -type d -exec mkdir -p "${HOME}"/.{} \;
find * -type f -exec ln -sf "${PWD}"/{} "${HOME}"/.{} \;
echo "Completed Configuring dotfiles!"

echo "Installing Homebrew packages..."
brew update
brew bundle install --global --no-lock
brew bundle cleanup --force --global
echo "Completed Installing Homebrew packages!"

echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended || true
echo "Completed Installing Oh My Zsh!"

echo "Configuring Projects..."
project_home="${HOME}"/Projects
mkdir -p "${project_home}"/Personal/sandbox
mkdir -p "${project_home}"/Work/sandbox
echo "Completed Configuring Projects!"

echo "Completed installation & configuration!"
