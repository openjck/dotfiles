paths := (
  home_directory() / '.bashrc ' +
  home_directory() / 'bin ' +
  home_directory() / '.profile ' +
  config_directory() / 'bash ' +
  config_directory() / 'profile ' +
  config_directory() / 'sh'
)

lint: shell-lint

format: shell-format

shell-lint:
  shfmt --list ${SHFMT_FORMATTING_FLAGS} {{paths}}
  vcsh-shellcheck

shell-format:
  shfmt --write --list ${SHFMT_FORMATTING_FLAGS} {{paths}}
