# awscli completion
complete -C aws_completer aws
# to fix LC_ALL issues in remote shells
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
# define JAVA_HOME using Oracle supplied command
export JAVA_HOME=$(/System/Library/Frameworks/JavaVM.framework/Versions/Current/Commands/java_home)
# For a ipython notebook and pyspark integration
if which pyspark > /dev/null; then
  export SPARK_HOME="/usr/local/Cellar/apache-spark/2.1.0/libexec/"   # set to whatever version spark you have. Update when necessary
  export PYSPARK_SUBMIT_ARGS="--master local[2]"
fi
# ssh keys - add whatever additional keys
eval $(ssh-agent)
ssh-add -A >/dev/null 2>&1
ssh-add -K /Users/<username>/.ssh/id_rsa >/dev/null 2>&1
# azure cli 2.x
export PATH=/Users/<username>/Library/Python/3.6/bin:/usr/local/sbin:$PATH
source /usr/local/bin/az.completion.sh
# sync history
export HISTSIZE=10000
export HISTFILESIZE=10000
shopt -s histappend
export PROMPT_COMMAND="history -a; ${PROMPT_COMMAND}"
