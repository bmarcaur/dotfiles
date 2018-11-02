#!/bin/sh
link() {
	file=$1
  current=`pwd`

  if [[ -e $HOME/$file ]]
  then
    read -p "Delete existing dotfile, $file?" -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
      echo "Deleting $file..."
      rm $HOME/$file
    else
      echo "Skipping $file"
      return
    fi
  fi

  echo "Linking file($file) from $current to $HOME"
	ln -s $current/$file $HOME/$file
}

# Symlink dotfiles
files=(.bash_profile .bashrc .bash_aliases .gemrc .gitconfig .irbrc .irbrc_rails .vimrc .gitignore)

for file in ${files[@]}
do
	link $file
done

# Ensure the nvim folder exists
mkdir -p $HOME/.config/nvim

# Symlink neovim folder
current=`pwd`
for nvim_folder in `ls $current/.config/nvim`
do
  link $nvim_folder
done

# Setup sublime user preferences
pref_dest="$HOME/Library/Application Support/Sublime Text 3/Packages/User"
# back it up just in case
mv "$pref_dest" "$pref_dest.bak.$(date +%Y%m%d.%H%M%S)"
# symlink to track the changes
ln -s $current/sublime-settings/ "$pref_dest"

echo "Sourcing the bash_profile"
source $HOME/.bash_profile
