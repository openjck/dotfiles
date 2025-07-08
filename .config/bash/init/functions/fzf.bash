# fzf-tmux is a command that ships with fzf. It opens fzf in a tmux pane,
# allowing shell history to remain on screen while fzf is used. When tmux is not
# being used, it transparently works like normal the normal fzf command.
function fzf() {
  fzf-tmux "$@"
}
