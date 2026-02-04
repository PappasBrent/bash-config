# ~/.bash_profile: executed by bash(1) for interactive login shells.
# If found, prevents reading from ~/.bash_login and ~/.profile.

# Changes to the PATH variable should go in here, and not ~/.bashrc, to avoid
# repeating these changes every time bash creates an interactive sub-shell.

# Changes PATH environment variables.
if [[ -f "$HOME/.bash_environment" ]]; then . "$HOME/.bash_environment"; fi

# Running bash as an login shell will prevent it from sourcing .bashrc
# automatically, so we do that manually here.
if [[ -f "$HOME/.bashrc" ]]; then . "$HOME/.bashrc"; fi
