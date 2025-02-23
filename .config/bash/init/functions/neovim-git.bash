function neovim-git() {
  # Open neogit in Neovim, with neogit replacing the normal startup screen
  # (i.e., being full screen) rather than opening beneath it.
  nvim -c 'lua require("neogit").open({ kind = "replace" })'
}
