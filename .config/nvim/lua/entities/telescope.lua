local custom = {}

local builtin = require('telescope.builtin')

function custom.dotfiles()
  builtin.find_files({
    prompt_title = 'dotfiles',
    find_command = {
      'bash',
      '-c',
      [[
        source "$XDG_CONFIG_HOME/bash/init/functions/vcsh-all.bash" && \
        source "$XDG_CONFIG_HOME/bash/init/functions/vcsh-list-files.bash" && \
        vcsh-list-files
      ]]
    }
  })
end

return custom
