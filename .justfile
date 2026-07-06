sh-paths := (
  home_directory() / '.bashrc ' +
  home_directory() / 'bin ' +
  home_directory() / '.profile ' +
  config_directory() / 'bash ' +
  config_directory() / 'profile ' +
  config_directory() / 'sh'
)

lint: sh-lint

format: sh-format

sh-lint:
  shfmt --list ${SHFMT_FORMATTING_FLAGS} {{sh-paths}}
  vcsh-shellcheck

sh-format:
  shfmt --write --list ${SHFMT_FORMATTING_FLAGS} {{sh-paths}}
