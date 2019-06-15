export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

export EDITOR=/usr/bin/nvim
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
