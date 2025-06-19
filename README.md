# Roiocam's dotfiles

- Obsidian
- EasyDict
- ~~EchoPaste~~/~~Clipy~~/~~Maccy~~/Raycast Clickboard History
- Rime + ice
- ScreenNote
- RunCat
- OrbStack
- CompressO
- Caesium Image Compressor
- Zotreo
- LocalSend
- ~~Iterm~~ WezTerm
- Drawio
- OmniGraffle
- ~~Zed~~VSCode `with` Copilot with `Scala Metals`
- The Unarchiver
- AeroSpace
- NeoVim `with` Kickstart.nvim
- Raycast

## Git Settings

.gitconfig
```
[credential]itconfig 
        helper = store
[user]
        name = Jingzhang Chen 
        email = roiocam@apache.org
[http "https://github.com"]
        proxy = socks5://127.0.0.1:1080
[includeIf "gitdir:~/IdeaProjects/path-to-dir/"]
        path = /Users/jingchen/IdeaProjects/path-to-dir/.gitconfig

```

cli

```bash
git config --global http.proxy http://proxyUsername:proxyPassword@proxy.server.com:port
git config --global http.https://domain.com.proxy http://proxyUsername:proxyPassword@proxy.server.com:port

git config --global --unset http.proxy
git config --global --unset http.https://domain.com.proxy

```

## ZSH

```
plugins=(
  colorize
  copypath
  copyfile
  docker
  docker-compose
  extract
  git
  history
  last-working-dir
  macos
  sudo
  vi-mode
  web-search
  z
  history-substring-search # git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
  zsh-autosuggestions # git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
  zsh-syntax-highlighting # git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
)

```


## P10k

https://stackoverflow.com/questions/61176257/customizing-powerleve10k-prompt


## Rime settings

1. Install Sq
2. `git clone https://github.com/iDvel/rime-ice.git Rime --depth 1`
3. mv ./Rime/** ~/Library/Rime


```yaml
  solarized_white:
    name: Solarized White
    author: "Roiocam <iroiocam@gmail.com>, based on Aben Solarized Rock scheme"
    candidate_list_layout: linear
    candidate_format: '%c %@'
    corner_radius: 3
    border_height: 1
    border_width: 1
    font_point: 15
    label_font_point: 12
    back_color: 0xffffff
    border_color: 0xffffff
    text_color: 0xeeeeeea
    hilited_text_color: 0x98a12a
    candidate_text_color: 0x969483
    comment_text_color: 0xc098a12a
    hilited_candidate_text_color: 0x8236d3
    hilited_candidate_back_color: 0xeeeeee
    hilited_comment_text_color: 0x362b00
```


## AeroSpace Settings

当你记住快捷键时，你就记住了你的应用在哪个桌面，下次你需要快速返回时，只需要用快捷键即可

当你想要移动 App 到另一个屏幕时，只需要用快捷键

当你需要在不同项目之间快速跳转时，自定义桌面，并快捷键切换他们

```toml
# Place a copy of this config to ~/.aerospace.toml
# After that, you can edit ~/.aerospace.toml to your liking

# It's not necessary to copy all keys to your config.
# If the key is missing in your config, "default-config.toml" will serve as a fallback

# You can use it to add commands that run after login to macOS user session.
# 'start-at-login' needs to be 'true' for 'after-login-command' to work
# Available commands: https://nikitabobko.github.io/AeroSpace/commands
after-login-command = []

# You can use it to add commands that run after AeroSpace startup.
# 'after-startup-command' is run after 'after-login-command'
# Available commands : https://nikitabobko.github.io/AeroSpace/commands
after-startup-command = []

# Start AeroSpace at login
# 默认启动
start-at-login = true

# Normalizations. See: https://nikitabobko.github.io/AeroSpace/guide#normalization
enable-normalization-flatten-containers = true
enable-normalization-opposite-orientation-for-nested-containers = true

# See: https://nikitabobko.github.io/AeroSpace/guide#layouts
# The 'accordion-padding' specifies the size of accordion padding
# You can set 0 to disable the padding feature
accordion-padding = 30

# Possible values: tiles|accordion
default-root-container-layout = 'tiles'

# Possible values: horizontal|vertical|auto
# 'auto' means: wide monitor (anything wider than high) gets horizontal orientation,
#               tall monitor (anything higher than wide) gets vertical orientation
default-root-container-orientation = 'auto'

# Possible values: (qwerty|dvorak)
# See https://nikitabobko.github.io/AeroSpace/guide#key-mapping
key-mapping.preset = 'qwerty'

# Mouse follows focus when focused monitor changes
# Drop it from your config, if you don't like this behavior
# See https://nikitabobko.github.io/AeroSpace/guide#on-focus-changed-callbacks
# See https://nikitabobko.github.io/AeroSpace/commands#move-mouse
on-focused-monitor-changed = ['move-mouse monitor-lazy-center']
on-focus-changed = "move-mouse window-lazy-center"

# Gaps between windows (inner-*) and between monitor edges (outer-*).
# Possible values:
# - Constant:     gaps.outer.top = 8
# - Per monitor:  gaps.outer.top = [{ monitor.main = 16 }, { monitor."some-pattern" = 32 }, 24]
#                 In this example, 24 is a default value when there is no match.
#                 Monitor pattern is the same as for 'workspace-to-monitor-force-assignment'.
#                 See: https://nikitabobko.github.io/AeroSpace/guide#assign-workspaces-to-monitors
# 设置窗口的边距（padding）
[gaps]
inner.horizontal = 10
inner.vertical =   10
outer.left =       10
outer.bottom =     10
outer.top =        10
outer.right =      10

# 'main' binding mo1010e declaration
# See: https://nikitabobko.github.io/AeroSpace/guide#binding-modes
# 'main' binding mode must be always presented
[mode.main.binding]

# All possible keys:
# - Letters.        a, b, c, ..., z
# - Numbers.        0, 1, 2, ..., 9
# - Keypad numbers. keypad0, keypad1, keypad2, ..., keypad9
# - F-keys.         f1, f2, ..., f20
# - Special keys.   minus, equal, period, comma, slash, backslash, quote, semicolon, backtick,
#                   leftSquareBracket, rightSquareBracket, space, enter, esc, backspace, tab
# - Keypad special. keypadClear, keypadDecimalMark, keypadDivide, keypadEnter, keypadEqual,
#                   keypadMinus, keypadMultiply, keypadPlus
# - Arrows.         left, down, up, right

# All possible modifiers: cmd, alt, ctrl, shift

# All possible commands: https://nikitabobko.github.io/AeroSpace/commands

# You can uncomment this line to open up terminal with alt + enter shortcut
# See: https://nikitabobko.github.io/AeroSpace/commands#exec-and-forget
# alt-enter = 'exec-and-forget open -n /System/Applications/Utilities/Terminal.app'
alt-shift-f = 'fullscreen'
# See: https://nikitabobko.github.io/AeroSpace/commands#layout
# 将窗口设置为左右，上下平铺
alt-slash = 'layout tiles horizontal vertical'
# 将窗口设置为左右，上下堆叠（手风琴）
alt-comma = 'layout accordion horizontal vertical'

# See: https://nikitabobko.github.io/AeroSpace/commands#focus
# 同一个桌面下，将焦点切换到另一个窗口
alt-h = 'focus left'
alt-j = 'focus down'
alt-k = 'focus up'
alt-l = 'focus right'

# See: https://nikitabobko.github.io/AeroSpace/commands#move
# 同一个桌面下，切换窗口的位置
alt-shift-h = 'move left'
alt-shift-j = 'move down'
alt-shift-k = 'move up'
alt-shift-l = 'move right'

# See: https://nikitabobko.github.io/AeroSpace/commands#resize
# 同一个桌面下，自动调整焦点窗口的大小
alt-shift-minus = 'resize smart -50'
alt-shift-equal = 'resize smart +50'

# See: https://nikitabobko.github.io/AeroSpace/commands#workspace
# 切换到不同的桌面
alt-1 = 'workspace 1'
alt-2 = 'workspace 2'
alt-3 = 'workspace 3'
alt-4 = 'workspace 4'
alt-5 = 'workspace 5'
alt-6 = 'workspace 6'
alt-7 = 'workspace 7'
alt-8 = 'workspace 8'
alt-9 = 'workspace 9'
alt-b = 'workspace B' # Browse
alt-e = 'workspace E' # Finder
alt-n = 'workspace N' # Note
alt-o = 'workspace O' # Code
alt-t = 'workspace T' # Terminal
alt-g = 'workspace G' # Graph

# See: https://nikitabobko.github.io/AeroSpace/commands#move-node-to-workspace
# 将焦点窗口移动到不同的桌面
alt-shift-1 = 'move-node-to-workspace 1'
alt-shift-2 = 'move-node-to-workspace 2'
alt-shift-3 = 'move-node-to-workspace 3'
alt-shift-4 = 'move-node-to-workspace 4'
alt-shift-5 = 'move-node-to-workspace 5'
alt-shift-6 = 'move-node-to-workspace 6'
alt-shift-7 = 'move-node-to-workspace 7'
alt-shift-8 = 'move-node-to-workspace 8'
alt-shift-9 = 'move-node-to-workspace 9'
alt-shift-b = 'move-node-to-workspace B'
alt-shift-e = 'move-node-to-workspace E'
alt-shift-n = 'move-node-to-workspace N'
alt-shift-o = 'move-node-to-workspace O'
alt-shift-t = 'move-node-to-workspace T'
alt-shift-g = 'move-node-to-workspace G'
# See: https://nikitabobko.github.io/AeroSpace/commands#workspace-back-and-forth
alt-tab = 'workspace-back-and-forth'
# See: https://nikitabobko.github.io/AeroSpace/commands#move-workspace-to-monitor
# 切换窗口到不同的桌面
alt-shift-tab = 'move-workspace-to-monitor --wrap-around next'

# See: https://nikitabobko.github.io/AeroSpace/commands#mode
alt-shift-semicolon = 'mode service'

# 'service' binding mode declaration.
# See: https://nikitabobko.github.io/AeroSpace/guide#binding-modes
[mode.service.binding]
esc = ['reload-config', 'mode main']
r = ['flatten-workspace-tree', 'mode main'] # reset layout
#s = ['layout sticky tiling', 'mode main'] # sticky is not yet supported https://github.com/nikitabobko/AeroSpace/issues/2
f = ['layout floating tiling', 'mode main'] # Toggle between floating and tiling layout
backspace = ['close-all-windows-but-current', 'mode main']

alt-shift-h = ['join-with left', 'mode main']
alt-shift-j = ['join-with down', 'mode main']
alt-shift-k = ['join-with up', 'mode main']
alt-shift-l = ['join-with right', 'mode main']

# 检测到 wezterm 时，移动到桌面 T
[[on-window-detected]]
if.app-id = 'com.github.wez.wezterm'
run = "move-node-to-workspace T"

# 检测到 Finder 时，移动到桌面空间 E
[[on-window-detected]]
if.app-id = 'com.apple.finder'
run = "move-node-to-workspace E"

# 检测到笔记时，切换到桌面 N
[[on-window-detected]]
if.app-id = 'md.obisidian'
run = "move-node-to-workspace N"

# 检测到笔记时，切换到桌面 N
[[on-window-detected]]
if.app-id = 'com.apple.mail'
run = "move-node-to-workspace N"
w
# 检测到浏览器时，切换到桌面 B
[[on-window-detected]]
if.app-id = 'org.mozilla.firefox'
run = "move-node-to-workspace B"

# 检测到数据库时，切换到桌面 2
[[on-window-detected]]
if.app-id = 'com.jetbrains.datagrip'
run = "move-node-to-workspace 2"

# 检测到 IDEA 时，切换到桌面 O
[[on-window-detected]]
if.app-id = 'com.jetbrains.intellij'
run = "move-node-to-workspace O"

```

## HomeLab Apps

- Downloads: transmission,  qBittorrent
- Books: Calibre-Web, TaleBook, Kavita
- Notes: Obisidan, Outline, Joplin
- Videos: alist, emby, infuse, plex, jellyfish
- Photos: immich
- Others: wireguard, vaultwarden, RSSHub

