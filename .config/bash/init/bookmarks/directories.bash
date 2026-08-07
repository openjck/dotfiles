export BOOKMARKED_DIRECTORIES=(
  # Add directories related to shell scripts.
  "$HOME/bin"
  "$HOME/bin/general"
  "$HOME/bin/personal"
  "$HOME/bin/personal/local"
  "$HOME/bin/personal/local/temporary"
  "$HOME/bin/personal/vcsh"
  "$HOME/bin/personal/vcsh/dotfiles-openjck-setup-main"

  # Add directories related to Bash configuration and Bash functions.
  "$XDG_CONFIG_HOME/bash"
  "$XDG_CONFIG_HOME/bash/init"
  "$XDG_CONFIG_HOME/bash/init/functions"
  "$XDG_CONFIG_HOME/bash/init/functions/general"
  "$XDG_CONFIG_HOME/bash/init/functions/personal"
  "$XDG_CONFIG_HOME/bash/init/functions/personal/flatpak"
  "$XDG_CONFIG_HOME/bash/init/functions/personal/flatpak/local"

  # Add directories for important configurations.
  "$XDG_CONFIG_HOME/nvim"
  "$XDG_CONFIG_HOME/vcsh"
  "$XDG_CONFIG_HOME/vcsh/hooks-available"
  "$XDG_CONFIG_HOME/vcsh/hooks-enabled"

  # Add other directories.
  "$HOME/inbox"
  "$HOME/dev"
  "$HOME/dev/repos"
)

# Add each subdirectory of the $HOME/dev/repos directory.
for NODE in "$HOME/dev/repos"/*; do
  if [[ -d "$NODE" ]]; then
    BOOKMARKED_DIRECTORIES+=("$NODE")
  fi
done

# Add Windows directories if WSL is being used.
#
# This assumes that I've manually created a symlink named $HOME/windows-home
# which points to the files managed by windows.
if __in_wsl; then
  BOOKMARKED_DIRECTORIES+=("$HOME/windows-home")
  BOOKMARKED_DIRECTORIES+=("$HOME/windows-home/Downloads")
  BOOKMARKED_DIRECTORIES+=("$HOME/windows-home/Desktop")
fi

# Source private, non-pushed, local configurations, if any.
__source_if_file_exists \
  "$XDG_CONFIG_HOME/bash/init/directories/bookmarks/directories.local.bash"
