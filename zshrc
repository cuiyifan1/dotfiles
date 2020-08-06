# ---------------------------
# fzf 
# ---------------------------
# use fd search plugin as the defalut search engine and allow to include hidden file
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"

# alias
alias ip="ipconfig getifaddr en0"
alias gp="git push"
alias ga="git add"
alias gs="git status"
alias vim="nvim"
alias neo="neofetch"
alias ran="ranger"
