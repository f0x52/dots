# export vars
typeset -U path
path+=("${HOME}/bin")
path+=("${HOME}/.cargo/bin")
path+=("${HOME}/documents/src/rakudo-star-2017.07/install/bin/")
path+=("${HOME}/documents/src/rakudo-star-2017.07/install/share/perl6/site/bin")
path+=("/opt/cross/bin")

# enviroment
export GOPATH=${HOME}/documents/prog/go
export OCIO=${HOME}/documents/src/filmic-blender/config.ocio
export TERM=screen
export EDITOR=nvim
export BROWSER=${HOME}/.config/bin/waterfox

# aliases
alias :q="exit"
alias free="free -h"
alias grep="grep --color"
alias history="fc -l 1"
alias irc="ssh -t vitreus screen -R"
#alias ls="ls --color -F --group-directories-first"
alias ls="exa --group-directories-first --color=always"
alias l="exa --group-directories-first --color=always -l -a --git"
alias mp3="youtube-dl --extract-audio --audio-format mp3"
alias upload_w1r3="cat $1 | curl -F upload=@- https://w1r3.net"
alias view="feh -Z -F"
alias view_pixel="feh --force-aliasing"
alias highlighting='autossh vitreus_highlight "tail -f ~/.highlight 2> /dev/null" | while read line ; do echo "highlighted"; sudo glowy; done'
alias record='ffmpeg -f pulse -ac 2 -i default -f x11grab -r 30 -s 1920x1080 -i :0.0 -codec:a pcm_s16le -codec:v libx264 -preset ultrafast -qp 0 '
alias webserve="python3 -m http.server"

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

# prompt
PROMPT='%F{1}[] %a%F{1}%(!.root .)[%3c] %F{15}'
