# ~/.bash_profile: executed by bash(1) for interactive login shells.
# If found, prevents reading from ~/.bash_login and ~/.profile.

# Changes to the PATH variable should go in here, and not ~/.bashrc, to avoid
# repeating these changes every time bash creates an interactive sub-shell.

# Ruby Gems.
if [[ -d "~/.gem/ruby/3.2.0/gems/bin" ]]; then
    export PATH="$PATH:~/.gem/ruby/3.2.0/gems/bin/"
fi

# Technically this should go in .bashrc since it's not modifying PATH
# veriables, but since it's related to the above assignment I include it here.
if [[ -d "~/.gem/ruby/3.2.0/gems/" ]]; then
    export GEM_HOME="~/.gem/ruby/3.2.0/gems/"
    export GEM_PATH="~/.gem/ruby/3.2.0/gems/"
fi

# Running bash as an login shell will prevent it from sourcing .bashrc
# automatically, so we do that manually here.
if [[ -f "~/.bashrc" ]]; then
    . "~/.bashrc"
fi
