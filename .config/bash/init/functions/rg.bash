# Run rg with custom options and page the results. If there are no results,
# return immediately.
#
# Most custom options are set in ~/.config/ripgrep/config, so that they affect
# interactive usage as well as programmatic usage (including the Neovim plugin
# for ripgrep) but --pretty is set here because it's only valuable in
# interactive usage. If --pretty were set in the configuration file, among other
# potential problems, the ripgrep plugin for Neovim would produce results which
# show escape codes.
function rg() {
  command rg --pretty "$@" | ifne less
}
