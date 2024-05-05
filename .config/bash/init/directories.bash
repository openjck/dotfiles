# Add environment variables for LGTD directories.
export D_INBOX=$HOME/LGTD/inboxes/main
export D_PROJECT_SUPPORT=$HOME/LGTD/project-support/main

# Add environment variables for other general-purpose directories.
export D_BASH_FUNCTIONS_GLOBAL=$XDG_CONFIG_HOME/bash/init/functions
export D_BASH_FUNCTIONS_LOCAL=$XDG_CONFIG_HOME/bash/init/functions/local
export D_BIN=$HOME/bin
export D_BIN_LOCAL=$HOME/bin/local
export D_BIN_DOWNLOADED=$HOME/bin/local/downloaded
export D_BIN_TEMPORARY=$HOME/bin/local/temporary
export D_DEVEL=$HOME/devel
export D_REPOS=$HOME/devel/repos
export D_DOTFILES_OPENJCK=$HOME/devel/repos/dotfiles-openjck

# Add environment variables for Windows directories if WSL is being used.
if __in_wsl; then
  export D_WINDOWS_HOME=$HOME/windows-home
  export D_WINDOWS_DOWNLOADS=$HOME/windows-home/Downloads
  export D_WINDOWS_DESKTOP=$HOME/windows-home/Desktop
fi

# Source private, non-pushed, local configurations, if any.
__source_if_file_exists "$XDG_CONFIG_HOME/bash/init/directories.local.bash"
