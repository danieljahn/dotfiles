# dotfiles

## Creating new modules
- Create a new directory per application containing all corresponding config files
- Create a setup.sh
  - Link all config files
    ```
    _link $SOURCE_PATH $TARGET_PATH
    ```
  - Handle the other setup steps you need, e.g. installing plugins oder updating the app
- Create a backup.sh to if needed


## Setup
Run `make setup`

## Backup
Run `make backup`

## Credits
Inspired by the awesome dotfiles repos of [mathiasbynens](https://github.com/mathiasbynens/dotfiles) and [nelsonmestevao](https://github.com/nelsonmestevao/dotfiles).


