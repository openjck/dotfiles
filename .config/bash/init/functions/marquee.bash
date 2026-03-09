function marquee() {
  while true; do
    block "$@" | lolcat --animate --speed=40
  done
}
