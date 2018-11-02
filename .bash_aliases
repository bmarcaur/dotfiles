alias reload='source ~/.bash_profile'
alias reload_prompt='source ~/.bashrc'

alias cls='printf "\033c"'
alias ll="ls -a1"
alias gits='git st'
alias gita='git add -A :/'
alias gitd='git df'
alias gitc='git ci -m'
alias gw='./gradlew'

alias vim='nvim'

# Execute a git command scoped to "me"
gitme() {
  git $1 --author=$(git config --get user.email)
}

find_port() {
  lsof -i tcp:$1
}

generate_ssl() {
  [ -z "$1" ] && echo "No host supplied.Usage generate_ssl host port." && kill -INT $$;
  [ -z "$2" ] && echo "No port supplied. Usage generate_ssl host port." && kill -INT $$;
  echo "openssl s_client -showcerts -connect $1:$2 </dev/null 2>/dev/null | openssl x509 -outform PEM";
}

notify() {
  cmd="$*"
  eval $cmd
  ret=$?

  if [[ ${#cmd} -gt 140 ]]; then
    cmd=${cmd:0:100}...${cmd: -40}
  fi

  if [[ `uname -s` == Darwin ]]; then
    if [ $ret == 0 ]; then
      osascript -e "display notification \"$cmd\" with title \"Command finished\""
    else
      osascript -e "display notification \"$cmd\" with title \"Command failed with status $ret\""
    fi
  else
    if [ $ret == 0 ]; then
      notify-send -i dialog-information "Command finished" "$cmd"
    else
      notify-send -i dialog-warning "Command failed with status $ret" "$cmd"
    fi
  fi
}

git-size() {
  # Shows you the largest objects in your repo's pack file.
  # Written for osx.
  #
  # @see https://stubbisms.wordpress.com/2009/07/10/git-script-to-show-largest-pack-objects-and-trim-your-waist-line/
  # @author Antony Stubbs

  # set the internal field spereator to line break, so that we can iterate easily over the verify-pack output
  IFS=$'\n';

  # Optional count for longer lists
  count=${1:-5}

  # list all objects including their size, sort by size, take top 10
  objects=`git verify-pack -v .git/objects/pack/pack-*.idx | grep -v chain | sort -k3nr | head -n $count`

  echo "All sizes are in kB's. The pack column is the size of the object, compressed, inside the pack file."

  output="size,pack,SHA,location"
  for y in $objects
  do
      # extract the size in bytes
      size=$((`echo $y | cut -f 5 -d ' '`/1024))
      # extract the compressed size in bytes
      compressedSize=$((`echo $y | cut -f 6 -d ' '`/1024))
      # extract the SHA
      sha=`echo $y | cut -f 1 -d ' '`
      # find the objects location in the repository tree
      other=`git rev-list --all --objects | grep $sha`
      #lineBreak=`echo -e "\n"`
      output="${output}\n${size},${compressedSize},${other}"
  done

  echo -e $output | column -t -s ', '

}

slow-network() {
  HOST_NAME=$1
  RATE=$2
  LATENCY=$3

  sudo dnctl pipe 1 config bw $RATE delay $LATENCY
  echo "dummynet out proto tcp from any to $HOST_NAME pipe 1" | sudo pfctl -f -
  sudo pfctl -e
}

resume-network() {
  sudo pfctl -f /etc/pf.conf
  sudo dnctl -q flush
  sudo pfctl -d
}
