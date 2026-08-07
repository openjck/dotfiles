# shellcheck shell=sh

__distro_base() {
  # https://unix.stackexchange.com/a/46086/410447
  if [ -f /etc/alpine-release ]; then
    echo "alpine"
  elif [ -f /etc/arch-release ]; then
    echo "arch"
  elif [ -f /etc/debian_version ]; then
    echo "debian"
  elif [ -f /etc/gentoo-release ]; then
    echo "gentoo"
  elif [ -f /etc/redhat-release ]; then
    echo "redhat"
  elif [ -f /etc/SuSE-release ]; then
    echo "suse"
  else
    echo "__UNKNOWN__"
  fi
}
