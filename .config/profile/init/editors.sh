# shellcheck shell=sh

# Set the default editors.
export EDITOR=nvim
export VISUAL=nvim

# Explicitly set the path to Neovim for use with the "sudoedit" command.
#
# This is required if the sudo configuration sets "secure_path" to a value that
# include the path that Neovim is installed at, for example because Neovim was
# installed by Homebrew or another third-party package manager. "secure_path"
# overrides the user's $PATH.
export SUDO_EDITOR
SUDO_EDITOR=$(command -v nvim)
