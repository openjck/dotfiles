function ls --wraps ls
  command ls --color=auto --group-directories-first --human-readable $argv
end
