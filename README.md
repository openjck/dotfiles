These are my shell scripts, other custom commands, configuration files, and
more. Nothing here is especially groundbreaking or innovative, but I take
pleasure in crafting small, useful, beautiful tools with great love and care and
with great attention to detail. I'm sharing these things for the benefit of
others, and I sincerely hope others find them useful.

My shell scripts and other custom commands are well-documented, and readers may
also be interested in my methods of organization, my Bash configuration, my
Neovim configuration, my tmux configuration, and my Git configuration, among
other things.

## Tools that others may find useful

### Bash shell scripts

Bash shell scripts that might be useful to others are stored in the
[_bin/general_](bin/general) directory. They are written to be as general and as
self-contained as possible, so that others can easily use them. Please see the
README in that directory for more information.

### Bash functions

The [_.config/bash/init/functions_](.config/bash/init/functions) directory
contains custom commands which generally cannot be implemented as Bash shell
scripts for one reason or another.

Bash functions that might be useful to others are stored in the
[_.../functions/general_](.config/bash/init/functions/general) directory. Like
the _general_ Bash scripts, the _general_ functions are written to be as general
and as self-contained as possible, so that others can easily use them. Please
see the README in that directory for more information.

## Organization of Bash functions

I'm very pleased with the organization of my Bash functions. I've tried many
methods of organizing aliases and functions, but this method, inspired by
[fish](https://github.com/fish-shell/fish-shell), feels the most natural. No
aliases are used. Everything is a function, and every function has its own file.

One weakness with the organization of my Bash configuration is that loading an
interactive shell is pretty slow, relative to loading an unconfigured Bash
session, taking about 1-2 seconds on my laptop. That poor performance may have
something to do with how many files need to be read, although a quick experiment
in concatenating the files did not seem to speed things up dramatically.
Alternatively, the poor performance may be related to how many functions are
loaded. In either case, it's something I could look into in the future. For now,
it's not worth the effort. Waiting two seconds for a Bash shell to load is never
a meaningful bottleneck for me.

## Installation

### Everything

Follow these steps to install _all_ of these files:

1. Ensure `sudo` is installed and your user is able to run `sudo` commands
   successfully.
2. Download the
   [_dotfiles-openjck-setup-bootstrap_](./bin/personal/vcsh/dotfiles-openjck-setup-bootstrap)
   script.
3. Make _dotfiles-openjck-setup-bootstrap_ executable.
4. Run _dotfiles-openjck-setup-bootstrap_.

### Single shell script

See the [shell script documentation](docs/scripts.md) for information on how to
install and use single shell script.

### Single Bash function

See the [function documentation](docs/functions.md) for information on how to
install and use a single Bash function.

## Getting in touch

To ask questions or discuss these files, please use the
[Discussions](https://github.com/openjck/dotfiles/discussions) page.
