# Color directories both on MacOS and linux
if [ `uname` == "Darwin" ]; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi

alias sp='django shell_plus'
alias rs='django runserver'
alias ds='django demoserver'

alias dm='django schemamigration --auto'


alias la='ls -als'

# Some env's seem to serve a different vim when starting with vi. So just alias to be sure
alias vi='vim'

