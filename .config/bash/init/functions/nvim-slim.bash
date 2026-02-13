function nvim-slim() {
  nvim --noplugin -u "$XDG_CONFIG_HOME/nvim/init-slim.lua" "$@"
}

__reuse-completions nvim nvim-slim
