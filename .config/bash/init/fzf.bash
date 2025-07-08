# Include hidden files when searching with fzf.
#
# https://github.com/junegunn/fzf/issues/337#issuecomment-136383876
export FZF_DEFAULT_COMMAND='find .'

# Enable Bash integration.
eval "$(fzf --bash)"
