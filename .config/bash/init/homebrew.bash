if __command_exists brew; then
  # Homebrew's setup script and manual recommend running this in .bashrc.
  eval "$(brew shellenv bash)"
fi
