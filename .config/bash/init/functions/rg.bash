# Run rg with custom options and page the results. If there are no results,
# return immediately.
function rg() {
  command rg --hidden "$@" | ifne less
}
