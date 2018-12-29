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
files=(.bash_profile .bashrc .bash_aliases .gemrc .gitconfig .irbrc .irbrc_rails .vimrc .gitignore_global)

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

# Ensure the nvim folder exists
config_location="$HOME/.config"
mkdir -p "$config_location"
# Symlink neovim folder
ln -s "$current/.config/nvim" "$config_location/nvim"
  
# Setup sublime user preferences
pref_dest="$HOME/Library/Application Support/Sublime Text 3/Packages/User"
# back it up just in case
mv "$pref_dest" "$pref_dest.bak.$(date +%Y%m%d.%H%M%S)"
# symlink to track the changes
ln -s "$current/sublime-settings/" "$pref_dest"

echo "Sourcing the bash_profile"
source "$HOME/.bash_profile"
