home := env('HOME')

# https://github.com/casey/just?tab=readme-ov-file#user-directories1230
xdg_config_home := if env('XDG_CONFIG_HOME', '') =~ '^/' {
  env('XDG_CONFIG_HOME')
} else {
  home / '.config'
}

paths := (
  home / '.bashrc ' +
  home / 'bin ' +
  home / '.profile ' +
  xdg_config_home / 'bash ' +
  xdg_config_home / 'profile ' +
  xdg_config_home / 'sh'
)

lint: shell-lint

format: shell-format

shell-lint:
  shfmt --list ${SHFMT_FORMATTING_FLAGS} {{paths}}
  vcsh-shellcheck

shell-format:
  shfmt --write --list ${SHFMT_FORMATTING_FLAGS} {{paths}}
