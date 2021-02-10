export DOTFILES="$HOME/repos/dotfiles"

# HOMEBREW
eval $(/opt/homebrew/bin/brew shellenv)
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi