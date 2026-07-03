#!/usr/bin/env bash
set -e

DOTFILES_DIR="$HOME/.dotfiles"

echo "==> Kur0's dotfiles installer"
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
echo "==> Trusting third-party taps..."
brew trust --formula hashicorp/tap/terraform 2>/dev/null || true
brew trust --cask productdevbook/tap/portkiller 2>/dev/null || true

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
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.5/install.sh | bash
else
  echo "==> nvm already installed"
fi

# ──────────────────────────────────────────────
# 5. Stow packages
# ──────────────────────────────────────────────
echo "==> Stowing dotfiles..."

packages=(zsh git nvim ghostty btop gh claude markdownlint)

for pkg in "${packages[@]}"; do
  echo "  -> $pkg"
  stow -d "$DOTFILES_DIR/packages" -t "$HOME" "$pkg"
done

echo ""
echo "==> Done! Restart your terminal to apply changes."
