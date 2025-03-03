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
      ]],
    }
  })
end

function custom.git_files_including_untracked()
  builtin.git_files({
    show_untracked = true,
  })
end

function custom.find_files_including_hidden()
  builtin.find_files({
    hidden = true,
  })
end

return custom
