local custom = {}

local builtin = require('telescope.builtin')

function custom.dotfiles()
  builtin.find_files({
    prompt_title = 'dotfiles',
    find_command = { 'bash', '-c', 'source "$HOME/.bashrc" && vcsh-all ls-files "$HOME"' }
  })
end

return custom
