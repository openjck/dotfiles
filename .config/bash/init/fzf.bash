# Include hidden files when searching with fzf.
#
# https://github.com/junegunn/fzf/issues/337#issuecomment-136383876
export FZF_DEFAULT_COMMAND='find .'

# This environment variable is not used by fzf itself, but rather by the "fzf"
# function with the --history option.
export FZF_HISTORY_FILE=$XDG_DATA_HOME/history

# Enable Bash integration.
#
# Use `command fzf` so that the fzf alias is not used when doing this. I don't
# think using the alias does any harm at the time of this writing, but depending
# on what options are set, it theoretically could in the future.
eval "$(command fzf --bash)"
