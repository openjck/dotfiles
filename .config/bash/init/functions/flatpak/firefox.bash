function firefox() {
  __run_flatpak_with_fallback \
    org.mozilla.firefox \
    firefox \
    "$@"
}
