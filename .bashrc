# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If we are not running interactively, stop processing.
if [[ ! "$-" =~ "i" ]]; then exit 0; fi

# Prevent adding duplicate lines or lines starting with space to history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Append to the history file rather than overwrite it.
shopt -s histappend

# When exiting a shell session, append the last $HISTSIZE lines of input in
# that session to the history file. Afterward, truncate the history file to
# only contain $HISTFILESIZE lines of input if necessary.
HISTSIZE=1000
HISTFILESIZE=6000

# Record the date and time that each command was executed.
HISTTIMEFORMAT=$'%A %F %H:%M:%S %z\t'

# Avoid adding shutdown commands to history file (because otherwise, I will
# definitely accidentally execute them when I turn on my system and start
# scrolling through my previous commands...)
export HISTIGNORE+=":shutdown*"
# Also ignore clear commands.
export HISTIGNORE+=":clear"

# Save multi-line commands in history with newlines rather than semicolons.
shopt -s lithist

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# Display current git branch in prompt
if command -v git >/dev/null 2>&1; then
    export PS1="\[\e[32m\]\w \[\e[91m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[\e[00m\]$ "
fi

# Enable color support for ls. See .bash_aliases for aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# Haskell installer.
if [[ -f "~/.ghcup/env" ]]; then
    source "~/.ghcup/env"
fi

# Enable vim mode
# set -o vi

# Enable cargo packages
if [[ -f "~/.cargo/env" ]]; then
    source "~/.cargo/env"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Set default editor.
export EDITOR=vim

# Run tmux at start.
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#    exec tmux
# fi

# Ruby gems (see .bash_profile for PATH changes)

# Center new windows by default
if command -v gsettings >/dev/null 2>&1; then
    gsettings set org.gnome.mutter center-new-windows true
fi

# TODO(Brent): Move completions elsewhere? Search bash(1) man pages for
# _completion_loader() for an example.

function complete_typst() {
    local -a commands
    commands=('compile' 'watch' 'init' 'query' 'fonts' 'help')

    if [[ "$1" == "$3" ]]
    then
        for word in "${commands[@]}"
        do
            if [[ "$word" =~ "$2" ]]
            then
                COMPREPLY+=($word)
            fi
        done
        return 0
    fi
    COMPREPLY=($(compgen -G *.typ))
}


# Add basic completions for typst commands.
if command -v typst >/dev/null 2>&1; then
    complete -F complete_typst typst
fi

# Remove PDFs from Vim's completion list.
if command -v vim >/dev/null 2>&1; then
    complete -f -X '*.pdf' vim
fi

# Custom functions.
function add() {
    local -i sum
    sum=0
    for x in "$@"; do ((sum += x)); done
    echo "$sum"
}

