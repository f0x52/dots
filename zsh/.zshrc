source .localzsh
# export vars
typeset -U path
path+=("${HOME}/bin")

# enviroment
export EDITOR="st -e nvim"

# aliases
alias :q="exit"
alias free="free -h"
alias grep="grep --color"
alias history="fc -l 1"
#alias ls="ls --color -F --group-directories-first"

# keys
typeset -A key
key[Delete]=${terminfo[kdch1]}
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "$key[Up]"   ]] && bindkey -- "$key[Up]"   up-line-or-beginning-search
[[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search
bindkey "${terminfo[kpp]}" up-line-or-history       # [PageUp] - Up a line of history
bindkey "${terminfo[knp]}" down-line-or-history     # [PageDown] - Down a line of history
bindkey "${terminfo[khome]}" beginning-of-line      # [Home] - Go to beginning of line
bindkey "${terminfo[kend]}"  end-of-line            # [End] - Go to end of line
bindkey '^[[1;5C' forward-word                        # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word                       # [Ctrl-LeftArrow] - move backward one word

# theming
eval "$(dircolors -b)"

# completion
autoload -Uz compinit
compinit -d "${HOME}/.zcompdump-${ZSH_VERSION}"
zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "$LS_COLORS"
zstyle ':completion:*' menu select auto
zstyle ':completion::complete:*' cache-path "${HOME}/.cache/zcompcache"
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*' rehash true

#history
HISTFILE=$HOME/.zsh_history
SAVEHIST=100000
HISTSIZE=100000
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

