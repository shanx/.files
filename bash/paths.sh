# Add paths without duplication
# Used from: http://superuser.com/questions/39751/add-directory-to-path-if-its-not-already-there/39995#39995
add_to_path() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="$1:$PATH"
    fi
}
export -f add_to_path

add_to_path ~/.dotfiles/bin

# Include local bin directory in path if it exists
if [ -d ~/bin ] ; then
    add_to_path ~/bin
fi
