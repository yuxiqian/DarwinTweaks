# Lazily initialize jenv
lazy_load_jenv() {
  unset -f java jenv
  eval export PATH="${HOME}/.jenv/shims:${PATH}"
  eval "$(jenv init -)"
}

jenv() {
  lazy_load_jenv
  jenv $@
}

java() {
  lazy_load_jenv
  java $@
}

mvn() {
  lazy_load_jenv
  mvn $@
}

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT='%F{cyan}%n%f %U%~%u %F{cyan}${vcs_info_msg_0_}%f$ '
