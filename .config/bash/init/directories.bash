# Add environment variables for LGTD directories.
export D_INBOX=$HOME/LGTD/inboxes/main

# Add environment variables for Bash functions.
export D_BASH_FUNCTIONS=$XDG_CONFIG_HOME/bash/init/functions
export D_BASH_FUNCTIONS_LOCAL=$D_BASH_FUNCTIONS/local

# Add environment variables for ~/bin directories.
export D_BIN=$HOME/bin
export D_BIN_GENERAL=$D_BIN/general
export D_BIN_PERSONAL=$D_BIN/personal
export D_BIN_PERSONAL_FLATPAK=$D_BIN_PERSONAL/flatpak
export D_BIN_PERSONAL_LOCAL=$D_BIN_PERSONAL/local
export D_BIN_PERSONAL_LOCAL_DOWNLOADED=$D_BIN_PERSONAL_LOCAL/downloaded
export D_BIN_PERSONAL_LOCAL_TEMPORARY=$D_BIN_PERSONAL_LOCAL/temporary
export D_BIN_PERSONAL_VCSH=$D_BIN/personal/vcsh

# Add environment variables for config directories.
export D_CONFIG_NVIM=$XDG_CONFIG_HOME/nvim
export D_CONFIG_VCSH=$XDG_CONFIG_HOME/vcsh
export D_CONFIG_VCSH_HOOKS_AVAILABLE=$D_CONFIG_VCSH/hooks-available
export D_CONFIG_VCSH_HOOKS_ENABLED=$D_CONFIG_VCSH/hooks-enabled

# Add environment variables for other directories.
export D_DEVEL=$HOME/devel
export D_DEVEL_REPOS=$HOME/devel/repos
export D_DOTFILES_OPENJCK_SETUP=$D_CONFIG_VCSH_HOOKS_AVAILABLE/dotfiles-openjck-setup

# Add environment variables for Windows directories if WSL is being used.
if __in_wsl; then
  export D_WINDOWS_HOME=$HOME/windows-home
  export D_WINDOWS_DOWNLOADS=$HOME/windows-home/Downloads
  export D_WINDOWS_DESKTOP=$HOME/windows-home/Desktop
fi

# Source private, non-pushed, local configurations, if any.
__source_if_file_exists "$XDG_CONFIG_HOME/bash/init/directories.local.bash"
