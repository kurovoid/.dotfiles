#!/usr/bin/env bash
set -e

DOTFILES_DIR="$HOME/.dotfiles"

echo "==> Santiago's dotfiles installer"
echo ""

# ──────────────────────────────────────────────
# 1. Homebrew
# ──────────────────────────────────────────────
if ! command -v brew &>/dev/null; then
  echo "==> Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "==> Homebrew already installed"
fi

# ──────────────────────────────────────────────
# 2. Brew packages
# ──────────────────────────────────────────────
echo "==> Installing brew packages..."
brew bundle --file="$DOTFILES_DIR/Brewfile"

# ──────────────────────────────────────────────
# 3. Oh My Zsh
# ──────────────────────────────────────────────
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "==> Installing Oh My Zsh..."
  RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "==> Oh My Zsh already installed"
fi

# ──────────────────────────────────────────────
# 4. nvm
# ──────────────────────────────────────────────
if [ ! -d "$HOME/.nvm" ]; then
  echo "==> Installing nvm..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
else
  echo "==> nvm already installed"
fi

# ──────────────────────────────────────────────
# 5. Stow packages
# ──────────────────────────────────────────────
echo "==> Stowing dotfiles..."
cd "$DOTFILES_DIR"

packages=(zsh git nvim ghostty btop gh neofetch claude markdownlint)

for pkg in "${packages[@]}"; do
  echo "  -> $pkg"
  stow "$pkg"
done

# ──────────────────────────────────────────────
# 6. Google Cloud SDK (optional)
# ──────────────────────────────────────────────
if [ ! -d "$HOME/google-cloud-sdk" ]; then
  read -p "==> Install Google Cloud SDK? [y/N] " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    curl https://sdk.cloud.google.com | bash
  fi
else
  echo "==> Google Cloud SDK already installed"
fi

echo ""
echo "==> Done! Restart your terminal to apply changes."
