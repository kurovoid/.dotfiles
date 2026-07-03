# Kur0's dotfiles

macOS dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/). One command to set up a new machine.

## Fresh install

```bash
git clone https://github.com/kurovoid/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles && ./install.sh
```

The install script will:

1. Install Homebrew (if missing)
2. Trust third-party taps and install all packages from `Brewfile`
3. Install Oh My Zsh
4. Install nvm
5. Back up any auto-generated `.zshrc`/`.zprofile` to `.bak`
6. Symlink all configs via stow

Restart your terminal after the script finishes.

## What's managed

| Package       | Config location            | What it configures                  |
|---------------|----------------------------|-------------------------------------|
| `zsh`         | `~/.zshrc`, `~/.zprofile`, `~/.p10k.zsh` | Shell, Oh My Zsh, Powerlevel10k |
| `git`         | `~/.gitconfig`             | Git user, credential helpers        |
| `nvim`        | `~/.config/nvim/`          | LazyVim with custom plugins         |
| `ghostty`     | `~/.config/ghostty/`       | Terminal theme, font, opacity       |
| `btop`        | `~/.config/btop/`          | System monitor settings             |
| `gh`          | `~/.config/gh/config.yml`  | GitHub CLI preferences (not auth)   |
| `claude`      | `~/.claude/settings.json`  | Claude Code plugins and settings    |
| `markdownlint`| `~/.markdownlint-cli2.jsonc`| Markdown linter rules              |

## How stow works

Each directory in `packages/` is a stow package. Its contents mirror the path from `~`.

```
packages/nvim/.config/nvim/init.lua  →  symlinked to  →  ~/.config/nvim/init.lua
packages/zsh/.zshrc                  →  symlinked to  →  ~/.zshrc
```

The actual files live in the git repo. Your system reads them through the symlinks.

## Day-to-day usage

### Editing configs

Edit files normally — the symlinks mean changes go directly to the repo:

```bash
nvim ~/.zshrc           # edits ~/.dotfiles/packages/zsh/.zshrc
cd ~/.dotfiles
git add -A && git commit -m "update zshrc"
git push
```

### Pulling changes on another machine

```bash
cd ~/.dotfiles && git pull
```

Stow symlinks are already in place, so updates take effect immediately.

## Extending

### Add a new brew package

1. Install it: `brew install <package>`
2. Add the line to `Brewfile`
3. If it's from a third-party tap, also add the `tap` line and a `brew trust` command in `install.sh`
4. Commit and push

### Add a new app's config

1. Create the package directory mirroring the path from `~`:

   ```bash
   # For configs in ~/.config/
   mkdir -p ~/.dotfiles/packages/newapp/.config/newapp

   # For configs in ~/
   mkdir -p ~/.dotfiles/packages/newapp
   ```

2. Move the config file into the package:

   ```bash
   mv ~/.config/newapp/config.toml ~/.dotfiles/packages/newapp/.config/newapp/config.toml
   ```

3. Create the symlink:

   ```bash
   stow -d ~/.dotfiles/packages -t ~ newapp
   ```

4. Add the package name to the `packages` array in `install.sh`

5. If the tool's installer auto-generates config files (like Oh My Zsh does), add the file to the backup loop in step 5 of `install.sh`

6. Commit and push

### Remove a package

```bash
stow -D -d ~/.dotfiles/packages -t ~ packagename   # remove symlinks
rm -rf ~/.dotfiles/packages/packagename              # delete from repo
```

Remove it from the `packages` array in `install.sh` and commit.

## Not tracked (and why)

| Path                    | Reason                              |
|-------------------------|-------------------------------------|
| `~/.ssh/`               | Secrets — copy manually or use 1Password SSH agent |
| `~/.config/gh/hosts.yml`| Contains auth tokens                |
| `~/.zsh_history`        | Machine-specific                    |
| `~/.claude.json`        | Session data, not config            |
| `~/.nvm/`               | Managed by nvm itself               |
| `~/.oh-my-zsh/`         | Managed by its own installer/updater |
| `~/.infisical/`         | Credentials                         |

## Structure

```
~/.dotfiles/
├── packages/           # all stow packages
│   ├── zsh/
│   ├── git/
│   ├── nvim/
│   ├── ghostty/
│   ├── btop/
│   ├── gh/
│   ├── claude/
│   └── markdownlint/
├── Brewfile            # brew formulae, casks, and taps
├── install.sh          # bootstrap script
└── README.md
```
