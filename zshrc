export ZSH="/Users/yifan/.oh-my-zsh"
export PATH="$PATH:/usr/local/smlnj/bin"
alias vim="nvim"
alias neo="neofetch"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh
export EDITOR="/usr/local/Cellar/neovim/0.4.3/bin/nvim"


# --------------------------
# Homebrew configurations
# --------------------------
# switch to Tuna source for Homebrew
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles


# ---------------------------
# fzf configurations for zsh 
# Setup fzf
# ---------------------------
# if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
#   export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
# fi
# fd --type f | fzf
# export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# source "/usr/local/opt/fzf/shell/completion.zsh"
# source "/usr/local/opt/fzf/shell/key-bindings.zsh"


# ---------------------------
# rustup configurations
# ---------------------------
# used for updating toolchain
export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup
# used for updating rustup
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
