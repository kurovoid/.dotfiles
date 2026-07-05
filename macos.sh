#!/usr/bin/env bash
#
# macOS system preferences
# Run once on a fresh machine, then restart.
#

echo "==> Configuring macOS defaults..."

# ──────────────────────────────────────────────
# Finder
# ──────────────────────────────────────────────
# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true
# Show file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Show path bar at the bottom
defaults write com.apple.finder ShowPathbar -bool true
# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true
# Default to list view
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
# Search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# Disable warning when changing file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# Allow quitting Finder with Cmd+Q
defaults write com.apple.finder QuitMenuItem -bool true
# Show full POSIX path in window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true
# Don't warn before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false
# Avoid creating .DS_Store files on network and USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# Unhide the ~/Library folder
chflags nohidden ~/Library

# ──────────────────────────────────────────────
# Dock
# ──────────────────────────────────────────────
# Set icon size
defaults write com.apple.dock tilesize -int 48
# Autohide the Dock
defaults write com.apple.dock autohide -bool false
# Remove autohide delay
# defaults write com.apple.dock autohide-delay -float 0
# Speed up autohide animation
# defaults write com.apple.dock autohide-time-modifier -float 0.3
# Don't show recent apps
defaults write com.apple.dock show-recents -bool false
# Minimize to application
defaults write com.apple.dock minimize-to-application -bool true
# Don't rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false
# Don't animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# ──────────────────────────────────────────────
# Keyboard
# ──────────────────────────────────────────────
# Fast key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
# Short delay before repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 15
# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
# Disable auto-capitalize
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
# Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
# Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
# Disable automatic period substitution
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
# Enable full keyboard access for all controls (Tab through dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# ──────────────────────────────────────────────
# Trackpad
# ──────────────────────────────────────────────
# Enable tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# ──────────────────────────────────────────────
# Screenshots
# ──────────────────────────────────────────────
# Save to ~/Downloads instead of Desktop
defaults write com.apple.screencapture location -string "$HOME/Downloads"
# Save as PNG
defaults write com.apple.screencapture type -string "png"
# Disable shadow
defaults write com.apple.screencapture disable-shadow -bool true

# ──────────────────────────────────────────────
# General
# ──────────────────────────────────────────────
# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# ──────────────────────────────────────────────
# Screen
# ──────────────────────────────────────────────
# Require password immediately after sleep or screen saver
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# ──────────────────────────────────────────────
# Apply changes
# ──────────────────────────────────────────────
killall Finder 2>/dev/null
killall Dock 2>/dev/null

echo "==> Done! Some changes require a restart to take effect."
