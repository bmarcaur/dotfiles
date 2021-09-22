#!/bin/bash

export JAVA_LATEST='/usr/local/opt/openjdk/libexec/openjdk.jdk/Contents/Home'
export JAVA_11_HOME='/usr/local/opt/openjdk@11/libexec/openjdk.jdk/Contents/Home'
export JAVA_16_HOME="$JAVA_LATEST"
export JAVA_HOME=$JAVA_LATEST

export EDITOR='nvim'

if [ -x /usr/libexec/path_helper ]; then
	eval `/usr/libexec/path_helper -s`
fi

# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# include .bash_aliases if it exists
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# include .bash_work if it exists
if [ -f ~/.bash_work ]; then
    source ~/.bash_work
fi

# include .bash_secret if it exists
if [ -f ~/.bash_secret ]; then
    source ~/.bash_secret
fi

export BASH_SILENCE_DEPRECATION_WARNING=1

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:$PATH"
export PATH="$HOME/.ldap_pick:/opt/homebrew/bin:$HOME/.cargo/bin:$HOME/.dotfiles/bin:$PATH"
export PATH="/usr/local/opt/python@3.7/bin:$PATH"

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi
