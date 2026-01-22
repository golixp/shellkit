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
├── helix
├── hx
├── lazygit
├── rg
├── yazi
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
