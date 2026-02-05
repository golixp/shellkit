# 设置 ZDOTDIR 指向 Shellkits 配置目录
export ZDOTDIR=$HOME/.local/share/shellkits/zsh

# 加入 Shellkits 工具集路径
path+=($HOME/.local/share/shellkits/kits)

# 配置默认编辑器, nvim > vim >vi
if (( $+commands[nvim] )); then
  export EDITOR=nvim
elif (( $+commands[vim] )); then
  export EDITOR=vim
else
  export EDITOR=vi
fi
export VISUAL=$EDITOR
