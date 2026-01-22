# P10k 即时提示(必须在最顶部)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# 加入 Shellkits 工具集路径
path+=($HOME/.local/share/shellkits/kits)

# --- 插件相关前置配置 ---
# ez-compinit配置: 开启补全系统缓存
# 路径优先级 $ZSH_COMPDUMP > $XDG_CACHE_HOME/zsh/zcompdump > ~/.cache/zsh/zcompdump 
zstyle ':plugin:ez-compinit' 'use-cache' 'yes'

# ez-compinit配置: 使用oh-my-zsh 风格的补全
# 官方提供 styles: gremlin, ohmy, prez, zshzoo
# 只有 ohmy 预设与 fzf-tab 兼容, 其它模式 group 标题会有无法渲染的占位符
zstyle ':plugin:ez-compinit' 'compstyle' 'ohmy'

# zephyr配置: 启用和关闭一些 editor 预设功能
zstyle ':zephyr:plugin:editor' 'prepend-sudo' yes # 快捷键加 sudo 功能
zstyle ':zephyr:plugin:editor' 'pound-toggle' no  # 空格后显示别名原始形态
zstyle ':zephyr:plugin:editor' 'magic-enter' no   # 回车自动执行 ls 或 git 命令

# 配合 fzf-tab 相关补全选项
zstyle ':completion:*:git-checkout:*' sort false   # git-checkout 关闭按字母排序
zstyle ':completion:*:descriptions' format '[%d]'  # 窗口增加 group 标题

# fzf-tab 内部配置
zstyle ':fzf-tab:*' fzf-flags --bind=tab:accept                               # 使用 Tab 键确认 fzf-tab 中的选项
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath' # 在 cd 界面使用 eza 显示目录内容


# --- 加载插件 ---
source $HOME/.local/share/shellkits/zsh/zsh_plugins.zsh


# 启动 P10k 主题
[[ ! -f $HOME/.local/share/shellkits/zsh/.p10k.zsh ]] || source $HOME/.local/share/shellkits/zsh/.p10k.zsh

# 启动fzf-tab
enable-fzf-tab

# 修复 zephyr-directory 预设与补全系统的问题
# 防止操作目录命令的 Tab 选项中出现隐藏文件
unsetopt glob_dots


# --- 快捷键绑定 ---
# 绑定 Alt + S 为命令前增加 sudo
bindkey '\es' prepend-sudo

# 配置 zsh-history-substring-search 快捷键
bindkey '^[[A'   history-substring-search-up    2>/dev/null # '^[[A' 序列的上方向键
bindkey '^[OA'   history-substring-search-up    2>/dev/null # '^[[A' 序列的上方向键

bindkey '^[[B'   history-substring-search-down  2>/dev/null # '^[[B' 序列的下方向键
bindkey '^[OB'   history-substring-search-down  2>/dev/null # '^[OB' 序列的下方向键

# --- 环境变量 ---
# 配置默认编辑器, hx > vi
export EDITOR=${${commands[hx]:+hx}:-vi}
export VISUAL=$EDITOR
