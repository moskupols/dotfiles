# ~/.profile

export EDITOR=vim
export SUDO_EDITOR=vim

if [ -n "$DISPLAY" ]; then
    export BROWSER=google-chrome
else
    export BROWSER=links
fi

export DOTFILES="$HOME"/repos/dotfiles
DOTF_BIN="$DOTFILES"/bin

if [[ $UID -ge 1000 && -d $DOTF_BIN && -z $(echo $PATH | grep -o $DOTF_BIN) ]]
then
    export PATH=$DOTF_BIN:${PATH}
fi

