# Dotfiles

Included programs from the .config dir:
@@include[program configs](config.md)

Dotfiles in the $HOME dir:
@@include[home dotfiles](dotfiles.md)

## Usage

Use `sync.sh` to sync the folders/files listed in `config.md` and `dotfiles.md` with the repo

Use `install.sh` to copy all the contents to the target folder
> Specify target folder with second argument, defaults to `$HOME`. Creates `.config` if it doesn't exist

