# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme agnoster-remco

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
set fish_plugins autojump brew extract

# Set locales: see https://groups.google.com/forum/#!topic/django-developers/AcLKevDgicY
set -gx  LC_ALL en_US.UTF-8  

# Python virtualenv support
set -g VIRTUALFISH_COMPAT_ALIASES
set -g VIRTUALFISH_HOME ~/Environments/
. ~/.files/external/virtualfish/virtual.fish
# optional plugins
. ~/.files/external/virtualfish/auto_activation.fish
. ~/.files/external/virtualfish/global_requirements.fish

# Change default completion color to a more readable version
set fish_color_command 0072ff

# Path to your custom folder (default path is $FISH/custom)
set fish_custom $HOME/.files/oh-my-fish

# Load autojump
. /usr/local/Cellar/autojump/HEAD/etc/autojump.fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# Path operations

# Homebrew paths
_append_path /usr/local/bin
_append_path /usr/local/sbin

# GNU bin replacement utilities
_append_path /usr/local/opt/coreutils/libexec/gnubin

# Docker host
set -gx DOCKER_HOST tcp://localhost:4243
