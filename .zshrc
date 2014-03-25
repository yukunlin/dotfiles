ZSH=$HOME/.oh-my-zsh
# Path to your oh-my-zsh configuration.

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="candy"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

plugins=(git z osx macports)

source $ZSH/oh-my-zsh.sh

# Case insensitive completion
autoload -U compinit
compinit -d ~/.zcompdump_`uname -s`

zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;32'
zstyle ':completion:*:processes-names' command 'ps -e -o comm='

# History settings
HISTSIZE=10000
setopt inc_append_history
setopt share_history
setopt hist_ignore_dups

HISTFILE=~/.history
SAVEHIST=10000

# SVN editor settings
export SVN_EDITOR=vim

# Aliases
alias knuth='ssh ylin@knuth.cs.hmc.edu'
alias mounthex='sshfs ylin@hex.math.hmc.edu:/home/students/hmc_2015/ylin /hex/ -oauto_cache,reconnect,defer_permissions,negative_vncache,volname=hex'
alias mountknuth='sshfs ylin@knuth.cs.hmc.edu:/mnt/home/ylin /knuth/ -oauto_cache,reconnect,defer_permissions,negative_vncache,volname=knuth'
alias mountlair='sshfs hmclair@lair.dreamhosters.com:/home/hmclair/lair.dreamhosters.com/owncloud/data/lair/files/LAIR /lair -oauto_cache,reconnect,defer_permissions,negative_vncache,volname=lair'
alias hex='ssh ylin@hex.math.hmc.edu'
alias pex='ssh ylin@pex.math.hmc.edu'
alias wilkes='ssh ylin@wilkes.cs.hmc.edu'
alias cortana='ssh ylin@cortana.cs.hmc.edu'
alias lair='ssh hmclair@lair.dreamhosters.com'
alias prolog='/opt/local/bin/swipl'
alias ls='ls --color=always'
alias cleantex='rm *.aux; rm *.log; rm *.pdfsync'
alias mv='nocorrect mv'
alias cp='nocorrect cp'
alias rm='nocorrect rm'
alias which='nocorrect which'

setopt nobeep
setopt noclobber
setopt correctall

# Resume in open diretory
if [[ "$TERM_PROGRAM" == "Apple_Terminal" ]] && [[ -z "$INSIDE_EMACS" ]]; then

    update_terminal_cwd() {
        # Identify the directory using a "file:" scheme URL, including
        # the host name to disambiguate local vs. remote paths.

        # Percent-encode the pathname.
        local URL_PATH=''
        {
            # Use LANG=C to process text byte-by-byte.
            local i ch hexch LANG=C
            for ((i = 1; i <= ${#PWD}; ++i)); do
                ch="$PWD[i]"
                if [[ "$ch" =~ [/._~A-Za-z0-9-] ]]; then
                    URL_PATH+="$ch"
                else
                    hexch=$(printf "%02X" "'$ch")
                    URL_PATH+="%$hexch"
                fi
            done
        }

        local PWD_URL="file://$HOST$URL_PATH"
        #echo "$PWD_URL"        # testing
        printf '\e]7;%s\a' "$PWD_URL"
    }

    # Register the function so it is called whenever the working
    # directory changes.
    autoload add-zsh-hook
    add-zsh-hook chpwd update_terminal_cwd

    # Tell the terminal about the initial directory.
    update_terminal_cwd
fi
