These commands are **not** secret or private. I haven't made a mistake by
publishing them.

Rather, these commands are written for my personal setup, my personal needs, and
my personal preferences. Most of these commands are pretty simple. Some are
effectively just aliases, but all are written as functions for the sake of
consistency. It's unlikely you'll want to run any of these commands as-is, so
I didn't bother to make them all self-contained. Even still, I'm sharing them
here so that you can learn from them if you'd like to.

For general-purpose commands that you _may_ be interested in downloading and
using, please see the [_general_](../general) directory.

If you _do_ want to use any of these commands, please see the ["Functions"
documentation](../../docs/functions.md) for installation instructions and other
important information.

## Development notes

### Reasons for using functions

The approach I'm using here allows me to call `__reuse-completions` in the file
that defines the command, which helps keep things organized. That wouldn't be
possible if these were shell scripts; calling `__reuse-completion` in the shell
script would not affect the interactive parent shell that called the shell
script. I would need one or more separate files in my Bash configuration which
call `__reuse-completion` as needed.

As explained in the [_general_](../general) directory, some of these commands
also would not function properly if they were shell scripts.

I could theoretically rewrite _some_ of these commands as shell scripts in the
[_~/bin/personal_](../../../../bin/personal) directory, the ones that don't
shadow commands, don't use `cd`, and don't call `__reuse-completions`. However,
I'd rather keep all of these small, relatively minor commands right here, in one
place.
