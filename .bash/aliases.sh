# Color directories both on MacOS and linux
if [ `uname` == "Darwin" ]; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi
