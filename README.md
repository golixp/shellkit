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
