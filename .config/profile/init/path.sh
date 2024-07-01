# shellcheck shell=sh

if __command_exists ruby; then
  PATH=$(ruby -e 'puts Gem.user_dir')/bin:$PATH
  export PATH
fi

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin/local/downloaded:$PATH"
export PATH="$HOME/apps/appimage:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/bin/local:$PATH"
export PATH="$HOME/bin/local/temporary:$PATH"
