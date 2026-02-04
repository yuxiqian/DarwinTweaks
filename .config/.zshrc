# Prerequisites:
# brew install zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search

source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT='%F{cyan}%n%f %U%~%u %F{cyan}${vcs_info_msg_0_}%f$ '

source "$HOME/.sdkman/bin/sdkman-init.sh"
