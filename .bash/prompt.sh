MITSUHIKOS_DEFAULT_COLOR="[00m"
MITSUHIKOS_GRAY_COLOR="[37m"
MITSUHIKOS_PINK_COLOR="[35m"
MITSUHIKOS_GREEN_COLOR="[32m"
MITSUHIKOS_ORANGE_COLOR="[33m"
MITSUHIKOS_RED_COLOR="[31m"
if [ `id -u` == '0' ]; then
  MITSUHIKOS_USER_COLOR=$MITSUHIKOS_RED_COLOR
else
  MITSUHIKOS_USER_COLOR=$MITSUHIKOS_PINK_COLOR
fi
MITSUHIKOS_VCPROMPT_EXECUTABLE=~/.dotfiles/bin/vcprompt

mitsuhikos_vcprompt() {
  $MITSUHIKOS_VCPROMPT_EXECUTABLE -f $' on \033[34m%n\033[00m:\033[00m%b\033[32m%m%u'
}

mitsuhikos_lastcommandfailed() {
  code=$?
  if [ $code != 0 ]; then
    echo -n $'\033[37m exited \033[31m'
    echo -n $code
    echo -n $'\033[37m'
  fi
}

mitsuhikos_virtualenv() {
  if [ x$VIRTUAL_ENV != x ]; then
    echo -n $' \033[37menv \033[31m'
    basename "${VIRTUAL_ENV}"
    echo -n $'\033[00m'
  fi
}

export MITSUHIKOS_BASEPROMPT='\n\e${MITSUHIKOS_USER_COLOR}\u\
\e${MITSUHIKOS_GRAY_COLOR} at \e${MITSUHIKOS_ORANGE_COLOR}\h \
\e${MITSUHIKOS_GRAY_COLOR}in \e${MITSUHIKOS_GREEN_COLOR}\w\
`mitsuhikos_lastcommandfailed`\
\e${MITSUHIKOS_GRAY_COLOR}`mitsuhikos_vcprompt`\
`mitsuhikos_virtualenv`\
\e${MITSUHIKOS_DEFAULT_COLOR}'
export PS1="${MITSUHIKOS_BASEPROMPT}
$ "

