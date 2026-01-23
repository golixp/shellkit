# P10k 即时提示(必须在最顶部)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# 加入 Shellkits 工具集路径
path+=($HOME/.local/share/shellkits/kits)


# --- git aliases ---
# 基本命令
alias g='git'
alias ga='git add'
alias gst='git status'

alias gss='git stash'
alias gf='git fetch'
alias grs='git reset'

alias gb='git branch'
alias gm='git merge'
alias grb='git rebase'
alias gcp='git cherry-pick'

# clone 相关
alias gcl='git clone --recurse-submodules'
alias gcld1='git clone --depth=1 --recurse-submodules'

# checkout 相关
alias gco='git checkout'
alias gcb='git checkout -b'

# push/pull 相关
alias gp='git push'
alias gl='git pull'
alias gpr='git pull --rebase'
alias gpra='git pull --rebase --autostash'

# log 相关
alias glog='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" --date=iso'
alias gloga='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" --date=iso --all'

# commit 相关
alias gc='git commit --verbose'
alias gcm='git commit --message'
alias gca='git commit --verbose --all'
alias gcam='git commit --all --message'
alias gc!='git commit --verbose --amend'

# --- eza aliases ---
typeset -ag eza_params
eza_params=(
  '--git'
  '--group'
  '--icons'
  '--group-directories-first'
  '--time-style=iso'
  '--color-scale=all'
)

alias ll='eza --all --header --long $eza_params'
alias llm='eza --all --header --long --sort=modified $eza_params'
alias lls='eza --all --header --long --total-size $eza_params'
alias lt='eza --tree $eza_params'
alias lg='eza --git-ignore $eza_params'


# --- 环境变量 ---
# 配置默认编辑器, hx > vi
if (( $+commands[hx] )); then
  export EDITOR=hx
elif (( $+commands[vim] )); then
  export EDITOR=vim
else
  export EDITOR=vi
fi
export VISUAL=$EDITOR


# --- 加载插件 ---
# ez-compinit配置: 开启补全系统缓存
# 路径优先级 $ZSH_COMPDUMP > $XDG_CACHE_HOME/zsh/zcompdump > ~/.cache/zsh/zcompdump 
zstyle ':plugin:ez-compinit' 'use-cache' 'yes'

# ez-compinit配置: 使用oh-my-zsh 风格的补全
# 官方提供 styles: gremlin, ohmy, prez, zshzoo
# 只有 ohmy 预设与 fzf-tab 兼容, 其它模式 group 标题会有无法渲染的占位符
zstyle ':plugin:ez-compinit' 'compstyle' 'ohmy'

# 配合 fzf-tab 相关补全选项
zstyle ':completion:*:git-checkout:*' sort false   # git-checkout 关闭按字母排序
zstyle ':completion:*:descriptions' format '[%d]'  # 窗口增加 group 标题

# fzf-tab 内部配置
zstyle ':fzf-tab:*' fzf-flags --bind=tab:accept                               # 使用 Tab 键确认 fzf-tab 中的选项
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath' # 在 cd 界面使用 eza 显示目录内容

source $HOME/.local/share/shellkits/zsh/zsh_plugins.zsh

# 配置 zsh-history-substring-search 快捷键
bindkey '^[[A'   history-substring-search-up    2>/dev/null # '^[[A' 序列的上方向键
bindkey '^[OA'   history-substring-search-up    2>/dev/null # '^[[A' 序列的上方向键

bindkey '^[[B'   history-substring-search-down  2>/dev/null # '^[[B' 序列的下方向键
bindkey '^[OB'   history-substring-search-down  2>/dev/null # '^[OB' 序列的下方向键

# 启动fzf-tab
enable-fzf-tab

# 初始化 zoxide
if (( $+commands[zoxide] )); then
  eval "$(zoxide init zsh)"
fi

# 启动 P10k 主题
[[ ! -f $HOME/.local/share/shellkits/zsh/.p10k.zsh ]] || source $HOME/.local/share/shellkits/zsh/.p10k.zsh

# --- 插件加载完成 ---