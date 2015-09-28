# this zshrc relies on oh-my-zsh, specifically on its fork by moskupols:
# moskupols/oh-my-zsh
#
#
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="fletcherm"
ZSH_THEME="moskupols"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13
#
# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

setopt interactivecomments

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    # my own
    cowgreet
    contestenv
    solarized-dircolors

    # somewhat customized
    systemd
    common-aliases
    thefuck

    # taken as is
    git
    svn
    archlinux
    virtualenv
    pip
    python
    )

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

source ~/.zshplaces

preexec() {
	SECONDS=0
}

precmd() {
	local last; last=$history[$[HISTCMD-1]]
	if ! grep -q vim <<<"$last"; then
		(( SECONDS > 20 )) &&  # Took more than 2 minutes, send alert
		notify-send --urgency=low -i ${${?/0/terminal}//<->*/error} $last
	fi
}

new-venv() {
    pyvenv ~/venvs/$1
}

activate-venv() {
	source ~/venvs/$1/bin/activate
}

