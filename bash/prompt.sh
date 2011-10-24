# Based on Mitshuhiko's dotfiles: https://github.com/mitsuhiko/dotfiles

PROMPT_DEFAULT_COLOR="[00m"
PROMPT_GRAY_COLOR="[37m"
PROMPT_PINK_COLOR="[35m"
PROMPT_GREEN_COLOR="[32m"
PROMPT_ORANGE_COLOR="[33m"
PROMPT_RED_COLOR="[31m"
PROMPT_ALERT_COLOR="[5;33;40m"
if [ `id -u` == '0' ]; then
    PROMPT_USER_COLOR=$PROMPT_ALERT_COLOR
else
    PROMPT_USER_COLOR=$PROMPT_PINK_COLOR
fi
# Check if we are connect to a remote server and change color of 
# machine name
if [ -n "${SSH_CLIENT}" ]; then
    PROMPT_HOST_COLOR=$PROMPT_RED_COLOR
else
    PROMPT_HOST_COLOR=$PROMPT_ORANGE_COLOR
fi

PROMPT_VCPROMPT_EXECUTABLE=~/.dotfiles/bin/vcprompt

prompt_vcprompt() {
  $PROMPT_VCPROMPT_EXECUTABLE -f $' on \033[34m%n\033[00m:\033[00m%b\033[32m'
}

prompt_lastcommandfailed() {
  code=$?
  if [ $code != 0 ]; then
    echo -n $'\033[37m exited \033[31m'
    echo -n $code
    echo -n $'\033[37m'
  fi
}

prompt_virtualenv() {
  if [ x$VIRTUAL_ENV != x ]; then
    ENV=`basename "${VIRTUAL_ENV}"`

    echo -n $' \033[37menv \033[36m'
    echo -n $ENV
    echo -n $'\033[00m'
  fi
}

export PROMPT_BASEPROMPT='\n\e${PROMPT_USER_COLOR}\u\
\e${PROMPT_GRAY_COLOR} at \e${PROMPT_HOST_COLOR}\h \
\e${PROMPT_GRAY_COLOR}in \e${PROMPT_GREEN_COLOR}\w\
`prompt_lastcommandfailed`\
\e${PROMPT_GRAY_COLOR}`prompt_vcprompt`\
`prompt_virtualenv`\
\e${PROMPT_DEFAULT_COLOR}'
export PS1="${PROMPT_BASEPROMPT}
$ "

