ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs command_execution_time ram)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_first_and_last"
POWERLEVEL9K_TIME_FORMAT='%D{%H:%M}'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='grey62'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='grey100'

DISABLE_AUTO_TITLE="true"

plugins=(git z osx)

source $ZSH/oh-my-zsh.sh

export SVN_EDITOR=vim

# History settings
HISTFILE=~/.history
# Aliases
alias knuth='ssh ylin@134.173.42.100'
alias mounthex='sshfs ylin@hex.math.hmc.edu:/home/students/hmc_2015/ylin /hex/ -o auto_cache,reconnect,defer_permissions,negative_vncache,volname=hex'
alias mountknuth='sshfs ylin@134.173.42.100:/mnt/home/ylin /knuth/ -o auto_cache,reconnect,defer_permissions,negative_vncache,volname=knuth'
alias mountlair='sshfs hmclair@lair.dreamhosters.com:/home/hmclair/lair.dreamhosters.com/owncloud/data/lair/files/LAIR /lair -o auto_cache,reconnect,defer_permissions,negative_vncache,volname=lair'
alias knuthtunnel='daemon -X ssh\ ylin@134.173.42.100\ -ND\ 9050 -n ssh_tunnel -r'
alias hex='ssh ylin@hex.math.hmc.edu'
alias pex='ssh ylin@pex.math.hmc.edu'
alias wilkes='ssh ylin@wilkes.cs.hmc.edu'
alias cortana='ssh ylin@cortana.cs.hmc.edu'
alias lair='ssh hmclair@lair.dreamhosters.com'
alias ls='ls -G'
alias updatedb='sudo /usr/libexec/locate.updatedb'
alias restart='sudo shutdown -r now'
alias hibernate='sudo pmset -a hibernatemode 25'
alias usleep='sudo pmset -a hibernatemode 0'
alias cleantex='rm *.aux *.log *.pdfsync'
alias math='/Applications/Mathematica.app/Contents/MacOS/MathKernel'
alias hl='~/py-hue/hue.py lights'
alias hg='~/py-hue/hue.py groups'
alias hs='~/py-hue/hue.py scenes'
alias hi='~/py-hue/hue.py image'
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi
alias cvim='/usr/local/bin/vim'

setopt nobeep
setopt noclobber

