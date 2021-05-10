# options
setopt autocd
setopt prompt_subst

# theme
source ~/.zsh/themes/agnoster.zsh-theme

# plugins
source ~/.zsh/plugins/git.plugin.zsh

# ls with color
alias ls='ls --color'

# tab completion with colors
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# tab completion case insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# up and down 
bindkey "$key[Up]" history-beginning-search-backward
bindkey "$key[Down]" history-beginning-search-forward
bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
