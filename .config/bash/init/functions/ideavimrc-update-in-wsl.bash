# Replace the WSL copy of the IdeaVim configuration file with the Windows copy
# of it.
#
# See the configuration file itself for more information about why this is
# necessary.
function ideavimrc-update-in-wsl() {
  local TARGET=$XDG_CONFIG_HOME/ideavim/ideavimrc

  if vcsh public diff --quiet "$TARGET"; then
    rm "$TARGET"
    cp --no-preserve=mode,ownership "$D_WINDOWS_HOME/.ideavimrc" "$TARGET"
  else
    >&2 echo 'Fatal error: WSL copy of IdeaVim configuration file contains uncommitted'
    >&2 echo '             changes. Commit them before proceeding.'
    return 1
  fi
}
