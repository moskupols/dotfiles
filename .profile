# ~/.profile

export EDITOR=vim
export SUDO_EDITOR=vim

if [ -n "$DISPLAY" ]; then
    export BROWSER=google-chrome
else
    export BROWSER=links
fi

# For java applications in awesome, see
# https://awesome.naquadah.org/wiki/FAQ
AWT_TOOLKIT=MToolkit

