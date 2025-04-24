# Roiocam's dotfiles
proxy working network through my home vpn.


- Obsidian
- EasyDict
- EchoPaste/Clipy/Maccy
- Rime + ice
- ScreenNote
- RunCat
- OrbStack
- CompressO
- Caesium Image Compressor
- Zotreo
- LocalSend
- Iterm
- Drawio
- OmniGraffle
- Zed
- The Unarchiver

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
