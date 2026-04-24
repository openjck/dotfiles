# shellcheck shell=sh

__get_os_id() {
  if [ -e /etc/os-release ]; then
    . /etc/os-release
  elif [ -e /usr/lib/os-release ]; then
    . /usr/lib/os-release
  fi

  if [ -n "$ID" ]; then
    echo "$ID"
  else
    echo "__UNKNOWN__"
  fi
}
