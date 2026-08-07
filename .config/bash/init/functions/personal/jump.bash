# Use fzf to navigate to any bookmarked directory or to $HOME.
#
# This cannot be a shell script because shell scripts are executed in subshells
# and therefore cannot cause the parent shell (the shell that called the shell
# script) to navigate.
function jump() {
  # Make "$HOME" the first choice so that it can be chosen quickly.
  #
  # Make the rest of the choices a sorted and unique collection of important
  # directories. The "$HOME" directory is excluded from this second category so
  # that it doesn't appear in the results twice, once as the first result and
  # once, sorted, among other important directories.
  CHOICES=$({
    echo "$HOME"
    while IFS= read -r DIR; do
      if [[ $DIR != "$HOME" ]]; then
        echo "$DIR"
      fi
    done <<< "$(sorted-bookmarked-directories)"
  })

  # Use the "end" tiebreaker because it helps fzf match the desired result much
  # more consistently when one knows the exact name of the directory they want
  # to jump to, even if they don't know or don't want to type the path leading
  # up to it. When I'm using "jump", I _do_ almost always know the exact name of
  # the directory I want to jump to, even though I don't want to type the whole
  # path leading up to it.
  if SELECTION=$(fzf --tiebreak=end <<<"$CHOICES"); then
    cdv "$SELECTION"
  fi
}
