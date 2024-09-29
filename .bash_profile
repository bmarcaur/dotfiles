#!/bin/bash

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

# include .bash_private if it exists
if [ -f ~/.bash_private ]; then
    source ~/.bash_private
fi

# include .bash_secret if it exists
if [ -f ~/.bash_secret ]; then
    source ~/.bash_secret
fi

export BASH_SILENCE_DEPRECATION_WARNING=1

# https://unix.stackexchange.com/a/124447
pathupdate() { case ":${PATH:=$1}:" in *:"$1":*) ;; *) PATH="$1:$PATH" ;; esac; }

# Ordered form least to most specific (because this is a stack)
pathupdate "$HOME/.jenv/bin"
pathupdate "$HOME/.dotfiles/bin"
pathupdate "$HOME/.dotfiles/bin-private"
pathupdate "/Volumes/git/palantir/oss/git-filter-repo"
pathupdate "/Volumes/git/palantir/oss/git-relevant-history"
# Allows endpoint engineering to curate certain binary overrides
pathupdate "/Library/Palantir/bin"
# intentionally elided due to some issues with GPG version conflicts
# pathupdate "/opt/homebrew/bin"

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi

eval "$(mcfly init bash)"
export MCFLY_FUZZY=2

export EDITOR='nvim'
export BAT_THEME='Solarized (dark)'
export PAGER='less'
export LESS='-RSFX --mouse --wheel-lines=3'

# Allows GPG to create TUI's in certain scenarios
GPG_TTY=$(tty)
export GPG_TTY

# Reminders 
echo "New git commands:"
echo "    wdiff   - subline diffing"
echo "    find    - find by regex in history"
echo "    staash  - stash plus untracked"
echo "    shame   - historical blame, tracks moves and original author"
echo "    flog    - reflog scoped to a single file"
echo "New aliases:"
echo "    nb      - create branch with name"
echo "New workflows:"
echo "    git commit --fixup=<commit>; git rebase --autosquash"
