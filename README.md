# Dotfiles

[![zoharcochavi](https://circleci.com/github/zoharcochavi/dotfiles.svg?style=shield)](https://app.circleci.com/pipelines/github/zoharcochavi/dotfiles)

[![zoharcochavi](https://circleci.com/gh/zoharcochavi/dotfiles.svg?style=shield)](https://app.circleci.com/pipelines/github/zoharcochavi/dotfiles)

Included programs from the `.config` dir:

[program configs](config.txt)

Dotfiles in the `$HOME` dir:

[home dotfiles](dotfiles.txt)

## Usage

Use `sync.sh` to sync the folders/files listed in `config.txt` and `dotfiles.txt` with the repo

Use `install.sh` to copy all the contents to the target folder
> Specify target folder with second argument, defaults to `$HOME`. Creates `.config` if it doesn't exist

