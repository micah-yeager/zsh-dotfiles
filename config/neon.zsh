TARGET="neon"
if ! type "$TARGET" > /dev/null; then
  [ "$DOT_FILES_DEBUG" ] && echo "$TARGET not found, skipping initialization."
  return
elif [ "$DOT_FILES_LOADED_NEON" ]; then
  [ "$DOT_FILES_DEBUG" ] && echo "$TARGET already loaded, skipping initialization."
fi
export DOT_FILES_LOADED_NEON=true

#compdef neon
###-begin-neon-completions-###
#
# yargs command completion script
#
# Installation: neon completion >> ~/.zshrc
#    or neon completion >> ~/.zprofile on OSX.
#
_neon_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" neon --get-yargs-completions "${words[@]}"))
  IFS=$si
  _describe 'values' reply
}
compdef _neon_yargs_completions neon
###-end-neon-completions-###
