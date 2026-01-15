# Run rg with custom options and page the results. If there are no results,
# return immediately.
#
# --glob=!.git/ tells rg to ignore files within ".git/" directories themselves.
function rg() {
  command rg --hidden --pretty --glob=!.git/ "$@" | ifne less
}
