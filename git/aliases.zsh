# Git Alias

# unalias ghelp 2>/dev/null
# function ghelp
# {
#     echo "========================================"
#     egrep "^alias|^function|^\#\#" ${HOME_SANDBOXBRUM}/profile/.bprofile_git
#     echo "========================================"
# }

## Add
alias ga="git add"
alias gaa="git add --all"
alias gap="git add --patch"

## Branch
alias gb="git branch"
alias gba="git branch -a"
alias gbr="git branch -r"
alias gbd="git branch -d"
alias gbD="git branch -D"
alias gbvv="git branch -vv"
alias gbm="branch_merged S"
alias gbmd="branch_merged S S"
alias gbms="branch_merged"
alias gbmv="git branch --move"
function branch_merged
{
    FILE_BRANCHS_MERGED="${HOME}/.git_branchs_merged"
    git branch --merged | grep -v "^*" | grep -v main > ${FILE_BRANCHS_MERGED}

    if [[ ${1} == "S" ]]; then
        for BRANCH in `cat ${FILE_BRANCHS_MERGED}`; do
            if [[ ${2} == "S" ]]; then
                git branch -D ${BRANCH}
            else
                git branch -d ${BRANCH}
            fi
        done
    else
        cat ${FILE_BRANCHS_MERGED}
    fi

    rm -rf ${FILE_BRANCHS_MERGED}
}

## Blame
alias gbl="git blame"

## Checkout
alias gco="git checkout"
alias gcom="git checkout main"
alias gcod="git checkout develop"
alias gcob="git checkout -b"
unalias gj 2>/dev/null
function gj
{
    if [[ $1 -lt 10 ]]; then MUD="0${1}"; else MUD=$1; fi
    git checkout release-MUD-J$MUD;
}

## Cherry-Pick
alias gcp="git cherry-pick"
alias gcpc="git cherry-pick --continue"
alias gcpa="git cherry-pick --abort"

## Clone
alias gcl="git clone"
alias gclsm="git clone --recurse-submodules"

## Commit
unalias gcm 2>/dev/null
function gcm
{
    commit_message=""
    while [[ ${1} != "" ]]; do
        if [[ ${commit_message} == "" ]]; then
            commit_message="${1}"
        else
            commit_message="${commit_message} ${1}"
        fi
        shift
    done

    if [[ ${commit_message} == "" ]]; then
        echo "commit message vazia"
        return 1
    else
        git commit -m "${commit_message}"
    fi
}

## Diff
alias gd="git diff"
alias gds="git diff --staged"

## Fetch
alias gf="git fetch --prune --prune-tags --force --recurse-submodules"
alias gff="git fetch --prune --force --recurse-submodules"

## Log
alias glg="git log --pretty=format:'%Cblue%H%Creset %C(bold)%cs%Creset %Cgreen<%an>%Creset %s' --max-count=20"
unalias glgx 2>/dev/null
function glgx
{
    max_count=${1}
    if [ -z ${max_count} ]; then max_count=10; fi
    git log --pretty=format:'%Cblue%H%Creset %C(bold)%cs%Creset %Cgreen<%an>%Creset %s' --max-count=${max_count}
}

## Pull
unalias gpl 2>/dev/null
function gpl
{
    current_branch=$(git rev-parse --abbrev-ref HEAD)
    git pull origin ${current_branch}
}

## Push
unalias gps 2>/dev/null
function gps
{
    current_branch=$(git rev-parse --abbrev-ref HEAD)
    git push origin ${current_branch}
}
unalias gpst 2>/dev/null
function gpst
{
    current_branch=$(git rev-parse --abbrev-ref HEAD)
    git push -u origin ${current_branch}
}
unalias gpsf 2>/dev/null
function gpsf
{
    current_branch=$(git rev-parse --abbrev-ref HEAD)
    git push -f origin ${current_branch}
}

## Stash
alias gsl="echo 'Stash list:'; git stash list; echo "-""
unalias gsp 2>/dev/null
function gsp
{
    stash_message=""
    while [[ ${1} != "" ]]; do
        if [[ ${stash_message} == "" ]]; then
            stash_message="${1}"
        else
            stash_message="${stash_message} ${1}"
        fi
        shift
    done

    if [[ ${stash_message} == "" ]]; then
        echo "stash message vazia"
        return 1
    else
        git stash push --include-untracked  --message "${stash_message}"
    fi
}

## Status
alias gs="git status -sbu"
alias gst="git status -u"

## Submodule
alias gsubir="git submodule update --init --recursive"
alias gsubr="git submodule update --recursive"

## Outros
alias grollback="git reset --soft HEAD~1"
alias gunstage="git reset HEAD --"
alias gunstageall="git reset HEAD"
alias gundo="git checkout --"
alias gundoall="git checkout ."
