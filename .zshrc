# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jorgen/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# zsh config
setopt sharehistory
setopt correct
setopt extendedhistory
setopt completeinword
setopt completealiases

# Setup history search for ctrl-r
bindkey '^R' history-incremental-search-backward

####################################################################################
# Install npm packages globally without sudo
#
# https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo.md
####################################################################################

NPM_PACKAGES="${HOME}/.npm-packages"

PATH="$NPM_PACKAGES/bin:$PATH"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

####################################################################################
# Setup pure prompt
#
# https://github.com/sindresorhus/pure
####################################################################################
autoload -U promptinit; promptinit
prompt pure


############################################
# Initialize Z 
#
# (https://github.com/rupa/z) 
############################################
. ~/z.sh 

#############################################
# Initialize aliases and functions
#############################################
source ~/.aliases
source ~/.functions



source /opt/ros/kinetic/setup.zsh
