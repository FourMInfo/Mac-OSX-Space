# export
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# For a ipython notebook and pyspark integration
if which pyspark > /dev/null; then
  export SPARK_HOME="/usr/local/Cellar/apache-spark/2.2.0/libexec/"
  export PYSPARK_SUBMIT_ARGS="--master local[2]"
fi
export JAVA_HOME=$(/System/Library/Frameworks/JavaVM.framework/Versions/Current/Commands/java_home)

# ssh keys
eval $(ssh-agent)
ssh-add -A >/dev/null 2>&1
ssh-add -K /Users/<your username>/.ssh/id_rsa >/dev/null 2>&1
ssh-add -K /Users/<your username>/.ssh/id_github >/dev/null 2>&1

# exercism
if [ -f ~/.config/exercism/exercism_completion.bash ]; then
  . ~/.config/exercism/exercism_completion.bash
fi

# sync history
export HISTFILESIZE=10000
shopt -s histappend
export PROMPT_COMMAND="history -a; ${PROMPT_COMMAND}"

# bash completion setup
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# docker & kubernetes 
#if [ `docker-machine status mydockervm` = "Running" ]; then eval $(docker-machine env mydockervm); fi #slow so commented out

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
