#!/bin/bash
set -Eeuo pipefail

trap "echo ERR trap fired!" ERR

# Install brew ToDO @BMA

# Make sure it is up to date
brew tap caskroom/versions
brew tap caskroom/cask
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
brew install gpg-agent
brew install stow
brew install ripgrep
brew install fd
brew install p7zip
brew install jq
brew install shellcheck

# Install node
brew install node@8

# Install common cask tools
brew cask install java
brew cask install java6
brew cask install java7
brew cask install java8
brew cask install docker
brew cask install spectacle

# Install nvim
brew install neovim
git clone https://github.com/gmarik/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
git clone git@github.com:Lokaltog/powerline-fonts.git
nvim +PluginInstall +qall

# Symlink sublime for editor
# ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl

# Make the commandhistory repo
mkdir -p ~/.history_repo

# Make the intellij iws repo
mkdir -p ~/.iws_repo

# set the default screenshot location
SCREENSHOT_LOCATION = ~/Documents/Screenshots
mkdir $SCREENSHOT_LOCATION
defaults write com.apple.screencapture location $SCREENSHOT_LOCATION

# Disable gatekeeper
# sudo spctl --master-disable

# Breakout further installation
echo "For ruby development setup run: ./setup/ruby.sh"
echo "To begin installing your dotfiles run: ./setup/dotfiles.sh"
