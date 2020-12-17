# ---------------------------
# fzf 
# ---------------------------
# use fd search plugin as the defalut search engine and allow to include hidden file
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"
export DISPLAY=:0 # make sure the remote server pick up the right display which
                  # is essential if you want to display remote server GUI applications 
                  # in local machine through X11 protocol

# alias
alias ip="ipconfig getifaddr en0"
alias gp="git push"
alias ga="git add"
alias gs="git status"
alias gl="git log --all --graph --decorate"
alias gr="git remote -v"
alias vim="nvim"
alias r="ranger"
