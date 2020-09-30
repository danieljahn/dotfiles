# HELPERS
function _mob_branch_name(){
    echo 0-mob-$(date --rfc-3339=date)
}

function _commit_prefix(){
    branch=$(git branch --show-current)
    regex="^([0-9]+)-"
    if [[ $branch =~ $regex ]]; then
     echo "#${BASH_REMATCH[1]}: "
    fi
}

# GIT
alias gs="git status"
alias gss="git status --short"
alias ga="git add"
alias gc="git checkout"
alias gcb="git checkout -b"
alias gf="git fetch"
alias gd="git diff"
alias gds="git diff --staged"
alias gpl="git pull"
alias gps="git push"
alias grh="git reset --hard"

function gcm(){
    git commit -m "$(_commit_prefix)$(echo $@)"
}

function gacp(){
    git add .;
    git commit -m "$(_commit_prefix)$(echo $@)";
    git push;
}

# MOB SESSION
function ms(){
    git checkout -b $(_mob_branch_name); 
    git push --set-upstream origin $(_mob_branch_name);
}

function mt(){
    git fetch;
    git checkout $(_mob_branch_name);
    git pull;
}

function mh(){
    git add .; 
    git commit -m "Handover";
    git push;
}
