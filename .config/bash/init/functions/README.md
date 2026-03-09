These are custom commands which I find helpful when using Bash. They are almost
exclusively used interactively, rather than used in shell scripts, and most are
pretty simple. These commands are written for my personal setup, my personal
needs, and my personal preferences. They are unlikely to be of any direct use to
others. There are some exceptions, though, like
[_module-root.bash_](./project-root.bash) and
[_p-search-all.bash_](./p-search-all.bash) and I hope to rewrite those as
scripts in the [_~/bin/general_](../../../../bin/general) directory in the
future.

These are not written as shell scripts in
[_~/bin/personal_](../../../../bin/personal) in some cases out of necessity and
in other cases because I find this more convenient. Regarding necessity, any
command that shadows another command cannot easily be implemented as a shell
script. Additionally, any command that navigates using "cd" cannot be
implemented as a shell script, because when "cd" is used in a shell script, it
doesn't affect the shell that called the shell script. As for convenience, this
approach allows me to call `__reuse-completions` in the same file as the
implementation of the command. That wouldn't be possible if these were shell
scripts for the same reason: calling `__reuse-completion` in the shell script
would not affect the shell that called it. I would need one or more separate
files in my Bash configuration which call `__reuse-completion` as needed.

I could theoretically rewrite _some_ of these as shell scripts
[_~/bin/personal_](../../../../bin/personal), the ones that don't shadow
commands, don't use "cd", and don't call `__reuse-completions`, but I'd rather
keep all of these little commands in the same place.
