# From: http://www.moosechips.com/2011/01/bash-pathmunge/
# Changed path of egrep from /bin/egrep to /usr/bin/egrep
pathmunge () {
        if ! echo $PATH | `type egrep` -q "(^|:)$1($|:)" ; then
           if [ "$2" = "after" ] ; then
              PATH=$PATH:$1
           else
              PATH=$1:$PATH
           fi
        fi
}

pathmunge ~/.dotfiles/bin/

# Include local bin directory in path if it exists
if [ -d ~/bin ] ; then
    pathmunge ~/bin
fi

export PATH
