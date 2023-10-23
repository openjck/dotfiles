# shellcheck shell=sh

DISTRO=$(lsb_release --short --id)
export DISTRO

# Although Bash provides a "$HOSTNAME" environment variable by default, POSIX sh
# does not. Providing one here allows us to use "$HOSTNAME" in other profile
# configuration files.
HOSTNAME=$(hostname)
export HOSTNAME

KERNEL=$(uname)
export KERNEL
