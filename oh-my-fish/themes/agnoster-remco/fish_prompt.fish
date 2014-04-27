# name: Agnoster
# agnoster's Theme - https://gist.github.com/3712874
# A Powerline-inspired theme for FISH
# Tweaked by Remco, based on his adaptations of agnoster's ZSH theme
#
# # README
#
# In order for this theme to render correctly, you will need a
# [Powerline-patched font](https://gist.github.com/1595572).

## Set this options in your config.fish (if you want to :])
# set -g default_user your_normal_user



set -g current_bg NONE
set segment_separator ''
set right_segment_separator ''
# ===========================
# Helper methods
# ===========================

set -g __fish_git_prompt_showdirtystate 'yes'
set -g __fish_git_prompt_char_dirtystate '±'
set -g __fish_git_prompt_char_cleanstate ''

function parse_git_dirty
  set -l submodule_syntax
  set submodule_syntax "--ignore-submodules=dirty"
  set git_dirty (command git status -s $submodule_syntax  2> /dev/null)
  if [ -n "$git_dirty" ]
    if [ $__fish_git_prompt_showdirtystate = "yes" ]
      echo -n "$__fish_git_prompt_char_dirtystate"
    end
  else
    if [ $__fish_git_prompt_showdirtystate = "yes" ]
      echo -n "$__fish_git_prompt_char_cleanstate"
    end
  end
end


# ===========================
# Segments functions
# ===========================

function prompt_segment -d "Function to draw a segment"
  set -l bg
  set -l fg
  if [ -n "$argv[1]" ]
    set bg $argv[1]
  else
    set bg normal
  end
  if [ -n "$argv[2]" ]
    set fg $argv[2]
  else
    set fg normal
  end
  if [ "$current_bg" != 'NONE' -a "$argv[1]" != "$current_bg" ]
    set_color -b $bg
    set_color $current_bg
    echo -n "$segment_separator "
    set_color -b $bg
    set_color $fg
  else
    set_color -b $bg
    set_color $fg
    echo -n " "
  end
  set current_bg $argv[1]
  if [ -n "$argv[3]" ]
    echo -n -s $argv[3] " "
  end
end

function prompt_finish -d "Close open segments"
  if [ -n $current_bg ]
    set_color -b normal
    set_color $current_bg
    echo -n "$segment_separator "
  end
  set -g current_bg NONE
  set_color normal
end

function prompt_on_newline -d "We prefer having the actual typing on a newline"
  echo
  echo '>> '
end


# ===========================
# Theme components
# ===========================

function prompt_user -d "Display actual user if different from $default_user"
  if [ "$USER" != "$default_user" -o -n "$SSH_CLIENT" ]
    set USER_PROMPT (whoami)@(hostname -s)
    # normal doesn't work here so force the normal grey color
    prompt_segment black eee $USER_PROMPT
  end
end

function prompt_dir -d "Display the actual directory"
  prompt_segment blue black (prompt_pwd)
end



function prompt_git -d "Display the actual git state"
  set -l ref
  set -l dirty
  if command git rev-parse --is-inside-work-tree >/dev/null 2>&1
    set dirty (parse_git_dirty)
    set ref (command git symbolic-ref HEAD 2> /dev/null)
    if [ $status -gt 0 ]
      set -l branch (command git show-ref --head -s --abbrev |head -n1 2> /dev/null)
      set ref "➦ $branch "
    end
    set branch_symbol ""
    set -l branch (echo $ref | sed  "s-refs/heads/-$branch_symbol -")
    if [ "$dirty" != "" ]
      prompt_segment yellow black "$branch $dirty"
    else
      prompt_segment green black "$branch $dirty"
    end
  end
end

function prompt_hg -d "Display the actual hg state"
  if command hg id >/dev/null 2>&1
    # Name colission so use stat
    set -l stat (command hg prompt "{status}")
    set -l branch (command hg prompt " {branch}")
    if [  "$status" = "?" ]
      # if files are not added
      prompt_segment red white "$branch"
    elif [ test "$status" = "!" ]
      # if any modification
      prompt_segment yellow black "$branch"
    else
      # if working copy is clean
      prompt_segment green black "$branch"
    end
  end
end

# Virtualenv: current working virtualenv
function prompt_virtualenv -d "Display current virtualenv"
  if set -q VIRTUAL_ENV
    set -l python_version (eval $VIRTUAL_ENV/bin/python -V 2>&1 | cut -f 2 -d ' ')
    set -l virtualenv_name (command basename $VIRTUAL_ENV)
    prompt_segment cyan black "⨀ $virtualenv_name ($python_version) "
  end
end

function prompt_status -d "the symbols for a non zero exit status, root and background jobs"
    if [ $RETVAL -ne 0 ]
      prompt_segment black red "✘"
    end

    # if superuser (uid == 0)
    set -l uid (id -u $USER)
    if [ $uid -eq 0 ]
      prompt_segment black yellow "⚡"
    end

    # Jobs display
    if [ (jobs -l | wc -l) -gt 0 ]
      prompt_segment black white "☗"
    end
end

# ===========================
# Apply theme
# ===========================

function fish_prompt
  set -g RETVAL $status
  prompt_status
  prompt_virtualenv
  prompt_user
  prompt_dir
  prompt_git
  prompt_hg
  prompt_finish
  prompt_on_newline
end

function fish_right_prompt -d "Display semi readable time on the right side, so I know when I executed something"
  set_color $fish_color_autosuggestion[1]
  echo -n -s (date +"%H:%M:%S")
end