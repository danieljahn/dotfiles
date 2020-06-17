if [[ $(uname) == 'Darwin' ]] 
then
    brew bundle dump --force --describe --file=Brewfile
fi
