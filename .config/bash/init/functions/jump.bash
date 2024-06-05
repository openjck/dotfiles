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
  CHOICES=$({
    echo "$HOME"
    {
      env | grep '^D_' | sed 's/^.*=//'
      find "$HOME/devel/repos" -maxdepth 1 -type d
    } | sort | uniq
  })

  if SELECTION=$(fzf <<< "$CHOICES"); then
    cdv "$SELECTION"
  fi
}
