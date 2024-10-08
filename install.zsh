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

  # Fonts
  local INSTALLED_FONTS=$(system_profiler SPFontsDataType)
  local TARGET_FONT_DIR="$HOME/Library/Fonts"
  if ! grep -q "MesloLGS-NF-Regular"; then
    curl -fsSL "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf" -O "$TARGET_FONT_DIR/MesloLGS-NF-Regular.ttf"
  fi
  if ! grep -q "MesloLGS-NF-Bold"; then
    curl -fsSL "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf" -O "$TARGET_FONT_DIR/MesloLGS-NF-Bold.ttf"
  fi
  if ! grep -q "MesloLGS-NF-Italic"; then
    curl -fsSL "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf" -O "$TARGET_FONT_DIR/MesloLGS-NF-Italic.ttf"
  fi
  if ! grep -q "MesloLGS-NF-Bold-Italic"; then
    curl -fsSL "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf" -O "$TARGET_FONT_DIR/MesloLGS-NF-Bold-Italic.ttf"
  fi


  # Homebrew
  [ -d "/opt/homebrew" ] || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # eza
  type eza > /dev/null || brew install eza
  # powerlevel10k
  [ -d "$HOMEBREW_PREFIX/opt/powerlevel10k" ] || brew install powerlevel10k
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

# Create and symlink locals files.
for ZSH_FILENAME (.zlogin .zprofile .zshrc); do
  local TARGET_ZSHRC_FILE="$HOME/$ZSH_FILENAME"
  local SOURCE_ZSHRC_FILE="$INSTALL_DIR/$ZSH_FILENAME.local"

  # Create local files if not yet initialized.
  if [ ! -f "$SOURCE_ZSHRC_FILE" ]; then
    echo -n "Creating $SOURCE_ZSHRC_FILE from template... "
    cp "$INSTALL_DIR/template/$ZSH_FILENAME.local" "$SOURCE_ZSHRC_FILE"
    echo "Done."
  else
    echo "$SOURCE_ZSHRC_FILE already exists, leaving it alone."
  fi

  # Move any existing files in the user's home.
  if [[ -f "$TARGET_ZSHRC_FILE" && ! -L "$TARGET_ZSHRC_FILE" ]]; then
    local OLD_ZSH_FILE="$TARGET_ZSHRC_FILE.old"

    echo -n "Moving existing $TARGET_ZSHRC_FILE to $OLD_ZSH_FILE... "
    mv "$TARGET_ZSHRC_FILE" "$OLD_ZSH_FILE"
    echo "Done."
  fi

  # Link the dot files version to the user's home.
  echo -n "Linking $SOURCE_ZSHRC_FILE to $TARGET_ZSHRC_FILE... "
  ln -sf "$SOURCE_ZSHRC_FILE" "$TARGET_ZSHRC_FILE"
  echo "Done."
done

# Import existing history
local HISTORY_FILE="$HOME/.zsh_history"
if [[ "$IMPORT_HISTORY" = "y" && -f "$HISTORY_FILE" ]]; then
  echo -n "Importing history... "
  yes | cp -f "$HISTORY_FILE" "$INSTALL_DIR/.zsh_history"
  echo "Done."
else
  echo "Skipping importing history per user input."
fi

echo ""
echo "Installation finished."
