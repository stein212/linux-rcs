# options
setopt autocd
setopt prompt_subst

# theme
source ~/.zsh/themes/agnoster.zsh-theme

# plugins
source ~/.zsh/plugins/git.plugin.zsh

# ls with color
eval $(dircolors ~/.zsh/dircolors/dircolors.256dark)
alias ls='ls --color'

# tab completion
## tab completion with colors
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
## tab completion case insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
## menu completion
zstyle ':completion:*' menu select
# shift-tab menu completion
bindkey '^[[Z' reverse-menu-complete

# up and down 
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "$key[Up]" history-beginning-search-backward-end
bindkey "$key[Down]" history-beginning-search-forward-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# own bin folder
export PATH="$PATH:$HOME/bin"
