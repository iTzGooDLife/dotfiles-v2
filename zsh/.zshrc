# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/julio/.zshrc'

autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# history setup
HISTFILE=$HOME/.zsh_history
SAVEHIST=2000
HISTSIZE=1000
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY

# End of lines added by compinstall
#source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source ~/powerlevel10k/powerlevel10k.zsh-theme

# Funcionalities
alias py=python3
alias ipy=ipython
alias ll='ls -l'
alias la='ls -A'
alias history="history 0"
alias v=nvim
alias cat=bat
alias xao='sudo shutdown now'
alias cs='checksec'
alias tree="tree -C"
alias checksec="pwn checksec"
alias cyclic="pwn cyclic"
alias mt="marktext ."
alias mkw="mkdir content exploits nmap"
alias sm="pamixer --default-source --set-volume"
alias jn="jupyter notebook"
alias kali="podman start kali && podman exec -it kali bash"
alias ipobj="echo $1 > /tmp/ipobj"
alias rmipobj="rm /tmp/ipobj"
alias watch="watch -n 1"
alias k=kubecolor
alias docker="podman"

# Colors
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'

# Binds
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# 
eval $(thefuck --alias fk)

# Plugins
source ~/.zplug/init.zsh
zplug "dekobon/zsh-kubecolor-completion"
zplug "unixorn/fzf-zsh-plugin"
zplug "Aloxaf/fzf-tab"
zplug "Freed-Wu/fzf-tab-source"

####

# Install plugins if there are plugins that have not been installed
export FZF_PREVIEW_ADVANCED=true
# export FZF_PREVIEW_WINDOW='right:45%:nohidden'
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

####

if ! zplug check --verbose; then
    echo; zplug install
fi

zplug load

#PATH=/usr/bin/python:$PATH
##NPM
export PATH=~/.npm-global/bin:$PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
