# Color directories both on MacOS and linux
if [ `uname` == "Darwin" ]; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi

alias sp='django shell_plus'
alias rs='django runserver'
alias ds='django demoserver'
