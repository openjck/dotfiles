# Enable completion of scripts I've written.
for completion_file in "$HOME/bin/general/completions"/*; do
  source "$completion_file"
done

unset -v completion_file
