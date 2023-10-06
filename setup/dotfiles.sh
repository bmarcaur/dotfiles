#!/bin/bash
set -Eeuo pipefail

trap "echo ERR trap fired!" ERR

link() {
	file=$1
  current=`pwd`

  if [[ -e "$HOME/$file" ]]
  then
    read -p "Delete existing dotfile, $file?" -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
      echo "Deleting $file..."
      rm "$HOME/$file"
    else
      echo "Skipping $file"
      return
    fi
  fi

  echo "Linking file($file) from $current to $HOME"
	ln -s "$current/$file" "$HOME/$file"
}

# Symlink dotfiles
files=(.bash_profile .bashrc .bash_aliases .gitconfig .vimrc .gitignore_global)

for file in ${files[@]}
do
	link $file
done

# Symlink my bin directory into home
# Ensure the dotfiles bin folder exists
dotfiles_bin_location="$HOME/.dotfiles"
mkdir -p "$dotfiles_bin_location"
# Symlink bin folder
ln -s "$current/bin" "$dotfiles_bin_location/bin"
ln -s "$current/bin-private" "$dotfiles_bin_location/bin-private"

# Ensure the nvim folder exists
config_location="$HOME/.config"
mkdir -p "$config_location"
# Symlink neovim folder
ln -s "$current/.config/nvim" "$config_location/nvim"

echo "Sourcing the bash_profile"
source "$HOME/.bash_profile"
