configure_history() {
	# Force multiline commands to one
	shopt -s cmdhist

	# Some history magic
	shopt -s histappend

	# On Disk buffersize
	export HISTFILESIZE=100000

	# Memort Buffer Size
	export HISTSIZE=100000

	# Commands to ignore
	export HISTIGNORE="&:bg:fg:ls:ll"

	# Add timestamps to the commands
	export HISTTIMEFORMAT="(%F %T %Z) "

	# Ignore whitespace and repeated commands
	export HISTCONTROL=ignoreboth

	# Append to the history
	shopt -s histappend
}

save_history() {
  history -a
  history 1 | cut -c 8- >> $HOME/.history_repo/history.$(date +%Y%m)
}

configure_prompt() {
	export GIT_PROMPT_THEME=Solarized
	export GIT_PROMPT_SHOW_UPSTREAM=1
	export GIT_PROMPT_SHOW_UNTRACKED_FILES=all

	export GIT_PROMPT_START_USER="_LAST_COMMAND_INDICATOR_ ${BoldMagenta}${PathShort}${ResetColor}"
  export GIT_PROMPT_START_ROOT="_LAST_COMMAND_INDICATOR_ ${GIT_PROMPT_START_USER}"
}

# Load Hist config
configure_history

# Load the prompt configuration
configure_prompt

export PROMPT_COMMAND=save_history

# Make bash check its window size after a process completes
shopt -s checkwinsize
