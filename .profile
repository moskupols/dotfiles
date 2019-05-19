# ~/.profile: executed by the command interpreter for login shells.
# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

export EDITOR=/usr/bin/nvim
export SUDO_EDITOR=/usr/bin/nvim

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

# Use common bin from dotfiles
export DOTFILES="$HOME/repos/dotfiles"
if [ -d "$DOTFILES/bin" ] ; then
    PATH="$DOTFILES/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
