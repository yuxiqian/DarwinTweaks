source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Initialize jenv
eval "$(jenv init - --no-rehash)"
(jenv rehash &) 2> /dev/null

