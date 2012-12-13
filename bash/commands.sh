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
        if [ ${2:false} ]; then
            pushd $nwd
        else
            cd $nwd # change directories to the new working directory
        fi
    else
        # print usage and return error
        echo "usage: up [NUMBER]"
        return 1
    fi
}

# Go up directory using pushd by default
function pup() {
    up $1 true
}

# From: http://unix.stackexchange.com/questions/14303/bash-cd-up-until-in-certain-folder
# By: dogbane

# Jump up to a certain named directory (supports tab completion via completions/upto.sh
upto ()
{
    if [ -z $1 ]; then
        return;
    fi;
    local upto=$1;
    cd "${PWD/\/$upto\/*//$upto}"
}

# Jump to nearest named child directory inside current parent dir
jd(){
    if [ -z $1 ]; then
        echo "Usage: jd [directory]";
        return 1
    else
        cd **/$1
    fi
}
