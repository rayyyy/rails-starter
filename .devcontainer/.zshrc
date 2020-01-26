# ZSH
# 補完機能有効にする
autoload -U compinit
compinit -u
# 補完候補に色つける
autoload -U colors
colors
zstyle ':completion:*' list-colors "${LS_COLORS}"

# 単語の入力途中でもTab補完を有効化
setopt complete_in_word
# 補完候補をハイライト
zstyle ':completion:*:default' menu select=1
# キャッシュの利用による補完の高速化
zstyle ':completion::complete:*' use-cache true
# 大文字、小文字を区別せず補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完リストの表示間隔を狭くする
setopt list_packed
# 削除する時の区切り文字 これでパスなどが全削除されなくなる
export WORDCHARS='*?_.[]~-=&;!#$%^(){}<>'

# コマンドの打ち間違いを指摘してくれる
# setopt correct
# SPROMPT="correct: $RED%R$DEFAULT -> $GREEN%r$DEFAULT ? [Yes/No/Abort/Edit] => "

setopt PROMPT_SUBST
PROMPT='%B%F{cyan}%n%f%b:%F{cyan}%~%f
%# '
# PROMPT ここまで

# alias
alias ls="ls -FG"
alias ll="ls -alFG"
alias la="ls -alFG"
alias g="git"
alias gd="git diff"
alias gs="git st"
alias gg="git grep"
alias gl="git l"
alias tails="tail -f"
alias gitbrdelete="git branch --merged|egrep -v '\*|develop|master'|xargs git branch -d"
