# fzf-tmux is a command that ships with fzf. It opens fzf in a tmux pane,
# allowing shell history to remain on screen while fzf is used. When tmux is not
# being used, it transparently works like normal the normal fzf command.
#
# With the history option set, CTRL-P can be used to quickly access past search
# terms, and CTRL-N can be used to move forward in history.
function fzf() {
  fzf-tmux -- --history="$XDG_DATA_HOME/fzf/history" "$@"
}
