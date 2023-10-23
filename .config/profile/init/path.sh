# shellcheck shell=sh

export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/bin/local"
export PATH="$PATH:$HOME/bin/local/downloaded"
export PATH="$PATH:$HOME/bin/local/temporary"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/bin"

if __command_exists ruby; then
  PATH=$PATH:$(ruby -e 'puts Gem.user_dir')/bin
  export PATH
fi
