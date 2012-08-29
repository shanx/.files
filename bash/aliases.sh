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

# Go up directory tree X number of directories
function up() {
    COUNTER="$1";
    # default $COUNTER to 1 if it isn't already set
    if [[ -z $COUNTER ]]; then
        COUNTER=1
    fi
    # make sure $COUNTER is a number
    if [ $COUNTER -eq $COUNTER 2> /dev/null ]; then
        nwd=`pwd` # Set new working directory (nwd) to current directory
        # Loop $nwd up directory tree one at a time
        until [[ $COUNTER -lt 1 ]]; do
            nwd=`dirname $nwd`
            let COUNTER-=1
        done
            cd $nwd # change directories to the new working directory
    else
        # print usage and return error
        echo "usage: up [NUMBER]"
        return 1
    fi
}
