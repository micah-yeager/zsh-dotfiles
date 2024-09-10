if ! type "neon" > /dev/null; then
  [ "$DOT_FILES_DEBUG" ] && echo "neon not found, skipping initialization."
  return
fi

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
