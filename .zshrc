###############
### Aliases ###
###############

# Alias .dot bare repo manager command
alias dot='/usr/bin/git --git-dir=$HOME/.dot/ --work-tree=$HOME'

# Git
alias g='git'

# Not to be disturbed by Ctrl-S ctrl-Q in terminals: (because of vim)
stty -ixon

#######################
### PATH Extensions ###
#######################

PATH=$PATH:$HOME/.yarn/bin
PATH=$PATH:$HOME/.config/yarn/global/node_modules/.bin
PATH=$PATH:$HOME/.config/composer/vendor/bin
PATH=$PATH:/usr/bin/eslint
export PATH

#########################
#### Global Variables ###
#########################

# Default configuration of ag for fzf to call
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
# Default editor in terminal
export EDITOR="/usr/bin/nvim"
# npm version manager(NVM) path
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export TERM="xterm-256color"
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

#################
### Oh-my-zsh ###
#################

#############
### Theme ###
#############

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE="nerdfont-complete"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_basename dir_writable)
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=""
POWERLEVEL9K_CUSTOM_BASENAME="echo -n \$(basename \$PWD)"
POWERLEVEL9K_CUSTOM_BASENAME_BACKGROUND="black"
POWERLEVEL9K_CUSTOM_BASENAME_FOREGROUND="yellow"

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time vcs dir)
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD="1"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND="transparent"
POWERLEVEL9K_HOME_ICON=""
POWERLEVEL9K_HOME_SUB_ICON=""
POWERLEVEL9K_FOLDER_ICON=""
POWERLEVEL9K_DIR_HOME_BACKGROUND="152"
POWERLEVEL9K_DIR_HOME_FOREGROUND="black"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="152"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="black"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="152"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="black"
POWERLEVEL9K_DIR_ETC_BACKGROUND="152"
POWERLEVEL9K_DIR_ETC_FOREGROUND="black"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

###############
### Scripts ###
###############

# Vi mode
# bindkey -v
# By default, there is a 0.4 second delay after you hit the <ESC> key and when the mode change is registered. This results in a very jarring and frustrating transition between modes. Let's reduce this delay to 0.1 seconds.
# export KEYTIMOUT=0

# Makes ^Z to foreground programs
function fg-bg() {
  if [[ $#BUFFER -eq 0 ]]; then
    fg
  else
    zle push-input
  fi
}
zle -N fg-bg
bindkey '^Z' fg-bg

# Solarized colorscheme for ls
# @source https://github.com/Anthony25/gnome-terminal-colors-solarized
if [ -f ~/.dir_colors/dircolors ]
    then eval `dircolors ~/.dir_colors/dircolors`
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
