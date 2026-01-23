## 使用方式

从 https://github.com/golixp/shellkit/releases 下载压缩包, 其中:

- `shellkits-core.tar.gz` 有全部命令.
- `shellkits.tar.gz` 去除了 `lazygit`/`hx`/`yazi` 三个比较占用空间的命令.

将压缩包上传到服务器, 执行命令:

```sh
tar -zxvf shellkits.tar.gz
```

之后可以执行脚本:

```sh
bash shellkits/add_user.sh # 交互式添加用户
bash shellkits/setup.sh    # 安装所有内容到 $HOME/.local/share/shellkits
```

## 功能介绍

`shellkits.tar.gz` 包含以下命令行工具:

- 终端编辑器: `hx`(Helix)
- 终端文件管理器: `yazi`
- 终端 Git 界面: `lazygit`
- 通用命令行模糊查找器: `fzf`
- `df` 现代化替代: `duf`
- `du` 现代化替代: `dust`
- `ls` 现代化替代: `eza`
- `cd` 现代化替代: `z` (zoxide)
- `cat` 现代化替代: `bat`
- `top` 现代化替代: `btm` (bottom)
- `find` 现代化替代: `fd`
- `grep` 现代化替代: `rg` (ripgrep)

以上内容会被放置到 `$HOME/.local/share/shellkits/kits`.

另外还包含一份 zsh 配置和插件, 位置在 `$HOME/.local/share/shellkits/zsh`, 通过 `.zshenv` 配置 zsh 默认读取此处的配置.

zsh 配置的特性有:

- 2c2g 云服务器平均加载以下功能所需插件时间损耗在 50ms 以内
- 默认包含上述 `$HOME/.local/share/shellkits/kits` 到 `$PATH`
- 类似 fish shell 的语法高亮/自动提示/历史搜索
- 常用命令的补全, 如 systemctl/apt/git/docker 等命令
- 集成基于 fzf 的模糊搜索到 Shell 的所有 Tab 补全中, 包括目录匹配/命令补全列表等各种类型
- 提示符带有 Git 集成, 可以显示当前目录 Git 状态
- 提示符带有时间戳和命令执行时间方便查看命令执行时间
- 集成 zoxide, 命令 `z` 替代 `cd` 可以按权重模糊跳转目录

附带 Git 别名如下:

```shell
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
alias 'gc!'='git commit --verbose --amend'
```

附带 eza 别名如下:

```shell
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
```

## 脚本介绍

`scripts/init.sh`: 下载 `zsh` 和 `eget`.

`scripts/eget-download-kits.sh`: 下载软件列表二进制到 `kits`

```
kits
├── bat
├── duf
├── dust
├── eza
├── fd
├── fzf
├── hx
├── lazygit
├── rg
├── yazi
├── btm
└── zoxide
```

`scripts/zsh-conf-build.zsh`: 会下载插件并生成插件加载脚本, 插件加载路径为 `$HOME/.local/share/shellkits/zsh`

```
zsh
├── antidote
│   ├── .bumpversion.cfg
│   ├── .editorconfig
│   ├── .git
│   ├── .github
│   ├── .gitignore
│   ├── LICENSE
│   ├── README.md
│   ├── antidote
│   ├── antidote.zsh
│   ├── functions
│   ├── makefile
│   ├── man
│   ├── tests
│   └── tools
├── plugins
│   ├── Aloxaf
│   ├── ajeetdsouza
│   ├── mattmc3
│   ├── romkatv
│   ├── zdharma-continuum
│   └── zsh-users
├── .zshenv
├── .zshrc
├── zsh_plugins.txt
└── zsh_plugins.zsh
```
