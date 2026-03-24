# FIXME: This is just a temporary function so that I can continue to use my
# muscle memory for the command "c". In the long term, I'd like this to work
# like cdv.bash.
function c --wraps cd
  cd $argv
end
