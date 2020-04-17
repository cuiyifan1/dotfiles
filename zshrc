# ---------------------------
# fzf 
# ---------------------------
export FZF_COMPLETION_TRIGGER='\'
# use fd search plugin as the defalut search engine and allow to include hidden file
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
