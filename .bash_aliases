# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
# sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Grun for Antlr
if [[ -f /usr/share/antlr4/grun ]]; then
    alias grun=/usr/share/antlr4/grun
fi

# Make xclip default to copying to the clipboard
if command -v xclip >/dev/null 2>&1; then
    alias xclip='xclip -selection clipboard'
fi

# Grep in current directory tree, ignoring the .git directory
alias ggrep='grep -r --exclude-dir=".git"'

# Type r to re-run the last command, and r <name> <pat>=<rep> reruns the last
# command starting with <name>, replacing every instance of <pat> with <rep>.
alias r='fc -s'

# For building better habits...
alias clear='echo "Hey Brent, use <C-M-L> instead!"'
