#!/bin/zsh

local GIT_HTTPS="https://github.com/micah-yeager/zsh-dotfiles.git"
local GIT_SSH="git@github.com:micah-yeager/zsh-dotfiles.git"

# Pre-flight checks.
if [ ! "$ZSH_VERSION" ]; then
  echo "ERROR: This script doesn't seem to be running with zsh, exiting." >&2
  exit 1
fi

# User input
local INSTALL_DIR="$HOME/dev/zsh-dotfiles"
vared -p "Where should the dot files be installed? " INSTALL_DIR
local INSTALL_AUTO_CONFIG_DEPS=y
vared -p "Should terminal-specific dependencies be auto-installed? " INSTALL_AUTO_CONFIG_DEPS
local IMPORT_HISTORY=y
vared -p "Should existing zsh history be imported? " IMPORT_HISTORY

# Download the dot files.
if [ ! -d "$INSTALL_DIR" ]; then
  local GIT_REMOTE="ssh"
  vared -p "Should the git remote use HTTPS (no auth required) or SSH? " GIT_REMOTE

  echo ""
  echo "Cloning into $INSTALL_DIR..."
  if [ "$GIT_REMOTE" = "ssh" ]; then
    git clone "$GIT_SSH" "$INSTALL_DIR"
  else
    git clone "$GIT_HTTPS" "$INSTALL_DIR"
  fi
  echo "Done."
else
  echo ""
  echo "Already installed, pulling latest changes..."
  git -C "$INSTALL_DIR" pull
  echo "Done."
fi
echo ""

# Install missing dependencies.
if [ "$INSTALL_AUTO_CONFIG_DEPS" = "y" ]; then
  echo "Installing dependencies..."
  # Homebrew
  [ -d "/opt/homebrew" ] || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # eza
  type eza > /dev/null || brew install eza
  # Nerd font
  brew list | grep -q font-jetbrains-mono-nerd-font || brew install font-jetbrains-mono-nerd-font
  # Oh My Zsh
  [ -d "$HOME/.oh-my-zsh" ] || CHSH=no RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  # Spaceship prompt
  [ -d "$HOMEBREW_PREFIX/opt/spaceship" ] || brew install spaceship
  # zsh-syntax-highlighting
  [ -d "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting" ] || brew install zsh-syntax-highlighting
  echo "Done."
else
  echo "Skipping installing dependencies per user input."
fi
echo ""

# Point zsh to use the dot files.
local ZSH_ENV_EXPORT="export ZDOTDIR=$INSTALL_DIR"
local ZSH_ENV_FILE="$HOME/.zshenv"
if [ ! -f "$ZSH_ENV_FILE" ]; then
  echo -n "Creating $ZSH_ENV_FILE... "
  echo "$ZSH_ENV_EXPORT" > "$ZSH_ENV_FILE"
  echo "Done."
elif ! grep -qxF "$ZSH_ENV_EXPORT" "${ZSH_ENV_FILE}"; then
  echo -n "Updating ${ZSH_ENV_FILE}... "
  echo "$ZSH_ENV_EXPORT" >> "$ZSH_ENV_FILE"
  echo "Done."
else
  echo "$ZSH_ENV_FILE is already up-to-date, leaving it alone."
fi

# Create locals file.
local LOCALS_FILE="$INSTALL_DIR/.zshrc.local"
if [ ! -f "$LOCALS_FILE" ]; then
  echo -n "Creating $LOCALS_FILE... "
  touch "$LOCALS_FILE"
  echo "Done."
else
  echo "Locals file already exists, leaving it alone."
fi

# Symlink locals file.
local TARGET_RC_FILE="$HOME/.zshrc"
local SOURCE_RC_FILE="$INSTALL_DIR/.zshrc.local"
if [[ -f "$TARGET_RC_FILE" && ! -L "$TARGET_RC_FILE" ]]; then
  echo -n "Moving existing $TARGET_RC_FILE to $TARGET_RC_FILE.old... "
  mv "$TARGET_RC_FILE" "$TARGET_RC_FILE.old"
  echo "Done."
fi
echo -n "Linking $SOURCE_RC_FILE to $TARGET_RC_FILE... "
ln -sf "$SOURCE_RC_FILE" "$TARGET_RC_FILE"
echo "Done."

# Import existing history
if [ "$IMPORT_HISTORY" = "y" ]; then
  echo -n "Importing history... "
  yes | cp -f "$HOME/.zsh_history" "$INSTALL_DIR/.zsh_history"
  echo "Done."
else
  echo "Skipping importing history per user input."
fi

echo ""
echo "Installation finished."
