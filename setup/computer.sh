# Install brew
sudo mkdir /opt
sudo chown -R `whoami` /opt
git clone https://github.com/homebrew/homebrew.git /opt/homebrew

# Make sure it is up to date
brew tap homebrew/versions
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
brew install p7zip

# Install node
brew install homebrew/versions/node5

# Install common cask tools
brew cask install java
brew cask install java6
brew cask install java7
brew cask install intellij-idea-ce
brew cask install virtualbox
brew cask install visual-studio-code
brew cask install docker
brew cask install spectacle
brew cask install spotify

# Install vim
brew install vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone git@github.com:Lokaltog/powerline-fonts.git
vim +PluginInstall +qall

# Install rbenv
brew install rbenv
brew install ruby-build

# Install Ruby
rbenv install 2.3.2
rbenv global 2.3.2

# Symlink sublime for editor
ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
ln -s /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code /usr/local/bin/vscode

# Make the commandhistory repo
mkdir -p ~/.history_repo

# set the default screenshot location
defaults write com.apple.screencapture location ~/Documents/Screenshots

# Disable gatekeeper
sudo spctl --master-disable

# Unpack Dotfiles
./setup/dotfiles.sh
