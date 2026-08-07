# shellcheck shell=sh

# Return true if running in WSL.
__in_wsl() {
  uname --kernel-release | grep --quiet microsoft-standard-WSL
}
