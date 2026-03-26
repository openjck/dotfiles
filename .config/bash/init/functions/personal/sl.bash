# Use slr (Steam Locomotive Random) and allow exiting with CTRL+C.
#
# Intentionally drop all other arguments, since "slr" doesn't accept any other
# arguments that might have been intended for ls.
function sl() {
  slr -e
}
