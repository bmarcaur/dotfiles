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

# include .bash_palantir if it exists
if [ -f ~/.bash_palantir ]; then
    source ~/.bash_palantir
fi

# include .bash_secret if it exists
if [ -f ~/.bash_secret ]; then
    source ~/.bash_secret
fi

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
export PATH="$HOME/.ldap_pick:/opt/homebrew/bin:$PATH"

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi

export EDITOR='subl'

export JAVA_1_6_HOME=`/usr/libexec/java_home -v '1.6*'`
export JAVA_1_7_HOME=`/usr/libexec/java_home -v '1.7*'`
export JAVA_1_8_HOME=`/usr/libexec/java_home -v '1.8*'`
export JAVA_HOME=$JAVA_1_8_HOME

# rbenv
export RBENV_ROOT="$HOME/.rbenv"

if [ -d $RBENV_ROOT ]; then
  export PATH="$RBENV_ROOT/bin:$PATH"
  eval "$(rbenv init -)"
fi

