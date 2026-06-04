#!/bin/bash

# 定义安装函数
# 参数 1: 命令名 (用于检查是否存在)
# 参数 2: 安装参数 (传给 brew install 的包名或参数)
brew_install_if_missing() {
  local cmd=$1
  local install_args=$2

  if ! command -v "$cmd" &>/dev/null; then
    echo "$cmd 未安装，正在安装..."
    brew install $install_args
  else
    echo "$cmd 已安装。"
  fi
}

# 1. 安装 Homebrew（如果没有安装）
if ! command -v brew &>/dev/null; then
  echo "Homebrew 未安装, 请安装"
else
  echo "Homebrew 已安装。"
fi

# 2. 安装常用工具
brew_install_if_missing "nvim" "neovim"
brew_install_if_missing "wezterm" "--cask wezterm"
brew_install_if_missing "aerospace" "--cask nikitabobko/tap/aerospace"
brew_install_if_missing "kubectl" "kubectl"
brew_install_if_missing "tmux" "tmux"
brew_install_if_missing "tree" "tree"
brew_install_if_missing "lazygit" "lazygit"

rew_install_if_missing "tree" "tree"

# 3. 安装 Oh My Zsh（如果没有安装）
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Oh My Zsh is already installed."
fi

ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

# 4. 安装 Powerlevel10k 主题（如果没有安装）
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
  echo "Installing Powerlevel10k..."
  git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ~/powerlevel10k
else
  echo "Powerlevel10k is already installed."
fi

# 5. 安装 zsh 插件（如果没有安装）
[ ! -d "${ZSH_CUSTOM}/plugins/zsh-history-substring-search" ] && git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM}/plugins/zsh-history-substring-search
[ ! -d "${ZSH_CUSTOM}/plugins/zsh-autosuggestions" ] && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
[ ! -d "${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting" ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting

# 6. 其他工具安装
brew_install_if_missing "claude" "--cask claude-code"
brew_install_if_missing "codex" "codex"
#brew_install_if_missing "gemini" "gemini-cli"
brew_install_if_missing "sbt" "sbt"
brew_install_if_missing "java" "openjdk"
brew_install_if_missing "gh" "gh"
brew_install_if_missing "graphviz" "graphviz"
brew_install_if_missing "copilot-cli" "copilot-cli"
#brew_install_if_missing "ghostty" "--cask ghostty"
#brew_install_if_missing "raycast" "--cask raycast"

echo "Installation completed! You can safely re-run this script."
