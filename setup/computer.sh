#!/bin/bash
set -Eeuo pipefail

trap "echo ERR trap fired!" ERR

# Install brew ToDO @BMA

# Make sure it is up to date
# brew tap caskroom/versions
# brew tap caskroom/cask
brew update

# Install autocomplete
brew install bash-completion
brew install bash-git-prompt

# Install tree
brew install tree

# Install openssl
brew install openssl

# Install Python
brew install python

# Install GNU Tools
brew install gnu-tar
brew install gnu-sed
brew install htop
brew install git-lfs
brew install stow

# Rust alternatives
brew install bat
brew install dust
brew install eza
brew install fd
brew install procs
brew install ripgrep
brew install sd
brew install tealdeer

brew install scc
brew install mcfly
brew install git-delta

brew install p7zip
brew install jq
brew install gron # flatten jq alternative for easier grepping
brew install shellcheck
brew install dos2unix

brew install jenv
echo "be sure to run 'jenv enable-plugin export' after adding a JVM"

# Install common cask tools
# brew cask install docker
brew install spectacle

# Install nvim
brew install neovim
git clone https://github.com/gmarik/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
git clone git@github.com:Lokaltog/powerline-fonts.git
nvim +PluginInstall +qall

# Make the commandhistory repo
mkdir -p ~/.history_repo

# set the default screenshot location
SCREENSHOT_LOCATION = ~/Documents/Screenshots
mkdir $SCREENSHOT_LOCATION
defaults write com.apple.screencapture location $SCREENSHOT_LOCATION

# Breakout further installation
echo "To begin installing your dotfiles run: ./setup/dotfiles.sh"
