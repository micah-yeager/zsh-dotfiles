#!/bin/zsh

# Pre-flight checks.
if [[ ! -v ZSH_VERSION ]]; then
  echo "\033[0;31mThis script doesn't seem to be running with zsh, exiting.\033[0m" >&2
  exit 1
fi

# User input
local INSTALL_DIR="$HOME/dev/zsh-dotfiles"
vared -p "Where should the dot files be installed? " INSTALL_DIR
local IMPORT_HISTORY=y
vared -p "Should existing zsh history be imported? " IMPORT_HISTORY
echo ""

# Download the dot files.
if [ ! -d "${INSTALL_DIR}" ]; then
  echo "Cloning into ${INSTALL_DIR}..."
  git clone "git@github.com:micah-yeager/zsh-dotfiles.git" "${INSTALL_DIR}"
  echo "Done."
else
  echo "Already installed, pulling latest changes..."
  git -C "${INSTALL_DIR}" pull
  echo "Done."
fi
echo ""

# Point zsh to use the dot files.
local TARGET_STRING="export ZDOTDIR=$INSTALL_DIR"
local TARGET_FILE="$HOME/.zshenv"
if [ ! -f "${TARGET_FILE}" ]; then
  echo -n "Creating ${TARGET_FILE}... "
  echo "$TARGET_STRING" > "${TARGET_FILE}"
  echo "Done."
elif ! grep -qxF "$TARGET_STRING" "${TARGET_FILE}"; then
  echo -n "Updating ${TARGET_FILE}... "
  echo "$TARGET_STRING" >> "${TARGET_FILE}"
  echo "Done."
else
  echo "${TARGET_FILE} is already up-to-date, leaving it alone."
fi

# Create locals file.
local LOCALS_FILE="${INSTALL_DIR}/.zshrc.local"
if [ ! -f "${LOCALS_FILE}" ]; then
  echo -n "Creating ${LOCALS_FILE}... "
  touch "${LOCALS_FILE}"
  echo "Done."
else
  echo "Locals file already exists, leaving it alone."
fi

# Symlink locals file.
local TARGET_RC_FILE="$HOME/.zshrc"
local SOURCE_RC_FILE="$INSTALL_DIR/.zshrc.local"
if [[ -f "${TARGET_RC_FILE}" && ! -L "${TARGET_RC_FILE}" ]]; then
  echo -n "Moving existing ${TARGET_RC_FILE} to ${TARGET_RC_FILE}.old... "
  mv "${TARGET_RC_FILE}" "${TARGET_RC_FILE}.old"
  echo "Done."
fi
echo -n "Linking ${SOURCE_RC_FILE} to ${TARGET_RC_FILE}... "
ln -sf "${SOURCE_RC_FILE}" "${TARGET_RC_FILE}"
echo "Done."

# Import existing history
if [ "$IMPORT_HISTORY" = "n" ]; then
  echo "Skipping importing history per user input."
else
  echo -n "Importing history... "
  yes | cp -f "$HOME/.zsh_history" "$INSTALL_DIR/.zsh_history"
  echo "Done."
fi

echo ""
echo "Installation finished."
