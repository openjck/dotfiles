# shellcheck shell=sh

# Set the default editors.
#
# For the value, provide the full path to Neovim rather than simply "nvim". This
# must be done to ensure sudoedit uses Neovim. sudoedit has a "secure_path"
# option which is set on many distros and which overrides the user's $PATH. The
# value of "secure_path" usually doesn't include the directory where Homebrew or
# other third-party package managers install packages, so if one of those
# third-party package managers was used to install Neovim, sudoedit wouldn't be
# able to find or use Neovim.
NVIM_PATH=$(command -v nvim)
export EDITOR="$NVIM_PATH"
export VISUAL="$NVIM_PATH"
