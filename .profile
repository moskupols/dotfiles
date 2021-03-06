export EDITOR=/usr/bin/vim
export SUDO_EDITOR="$EDITOR"

# Use common bin from dotfiles
export DOTFILES="$HOME/repos/dotfiles"
if [ -d "$DOTFILES/bin" ] ; then
    PATH="$DOTFILES/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
