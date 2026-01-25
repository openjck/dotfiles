# Use fzf to navigate to the home directory, any repo, or any directory assigned
# to an environment variable that starts with "D_".
function jump() {
  local CHOICES

  # Make "$HOME" the first choice so that it can be chosen quickly.
  #
  # Make the rest of the choices a sorted and unique list built from a _single
  # set_ that contains:
  #
  #   - All repos
  #   - All "D_" paths
  #
  # Errors from "find" are suppressed so that this function works even when the
  # "$HOME/devel/repos" directory does not exist, which might be the case if
  # someone is using this function outside of my broader setup.
  CHOICES=$({
    echo "$HOME"
    {
      env | grep '^D_' | sed 's/^.*=//'
      find "$HOME/devel/repos" -maxdepth 1 -type d 2> /dev/null
    } | sort --unique
  })

  # Use the "end" tiebreaker because it helps fzf match the desired result much
  # more consistently when one knows the exact name of the directory they want
  # to jump to, even if they don't know or don't want to type the path leading
  # up to it. When I'm using "jump", I _do_ almost always know the exact name of
  # the directory I want to jump to, even though I don't want to type the whole
  # path leading up to it.
  if SELECTION=$(fzf --tiebreak=end <<< "$CHOICES"); then
    cdv "$SELECTION"
  fi
}
