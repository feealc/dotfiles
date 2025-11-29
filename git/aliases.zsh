# Git Alias

function gh
{
    echo "========================================"
    egrep "^alias|^function|^\#\#" ${HOME_DOTFILES}/git/aliases.zsh
    echo "========================================"
}

alias g="git"

## Add
alias ga="git add"
alias gaa="git add --all"
alias gai="git add --interactive"
alias gap="git add --patch"

## Branch
alias gb="git branch"
alias gba="git branch --all"
alias gbd="git branch --delete"
alias gbdf="git branch --delete --force"
alias gbr="git branch --remotes"
alias gbvv="git branch -vv"
alias gbms="branch_merged"
alias gbm="branch_merged S"
alias gbmf="branch_merged S S"
alias gbmv="git branch --move"
function branch_merged
{
    FILE_BRANCHS_MERGED="${HOME}/.git_branchs_merged"
    git branch --merged | grep -v "^*" | grep -v main > ${FILE_BRANCHS_MERGED}

    if [[ ${1} == "S" ]]; then
        for BRANCH in `cat ${FILE_BRANCHS_MERGED}`; do
            if [[ ${2} == "S" ]]; then
                git branch --delete --force ${BRANCH}
            else
                git branch --delete ${BRANCH}
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
# alias gcom="git checkout main"
# alias gcod="git checkout develop"
# alias gcob="git checkout -b"

## Cherry-Pick
# alias gcp="git cherry-pick"
# alias gcpc="git cherry-pick --continue"
# alias gcpa="git cherry-pick --abort"

## Clone
alias gcl="git clone"
alias gclsm="git clone --recurse-submodules"

## Commit
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
        allow_empty_option=$(git_check_stagin_area_empty)
        git commit ${allow_empty_option} -m "${commit_message}"
    fi
}
function gcma
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

    commit_amend_options=""
    if [[ -z ${commit_message} ]]; then
        commit_amend_options="--no-edit"
    else
        commit_amend_options="-m \"${commit_message}\""
    fi

    allow_empty_option=$(git_check_stagin_area_empty)
    git commit ${allow_empty_option} --amend ${commit_amend_options}
}

## Diff
alias gd="git diff"
alias gds="git diff --staged"

## Fetch
alias gf="git fetch --prune --prune-tags --recurse-submodules"
alias gff="git fetch --prune --prune-tags --force --recurse-submodules"

## Log
GIT_LOG_FORMAT="%Cblue%H%Creset %C(bold)%cs%Creset %Cgreen<%an>%Creset %s"
function glgx
{
    max_count=${1}
    if [ -z ${max_count} ]; then max_count=10; fi
    git log --pretty=format:"${GIT_LOG_FORMAT}" --max-count=${max_count}
}
alias glg="glgx 20"

## Pull
function gpl
{
    current_branch=$(git_current_branch_name)
    git pull origin ${current_branch}
}
function gplr
{
    current_branch=$(git_current_branch_name)
    git pull --rebase origin ${current_branch}
}

## Push
function gps
{
    current_branch=$(git_current_branch_name)
    git push origin ${current_branch}
}
function gpst
{
    current_branch=$(git_current_branch_name)
    git push --set-upstream origin ${current_branch}
}
function gpsf
{
    current_branch=$(git_current_branch_name)
    git push --force origin ${current_branch}
}

## Stash
alias gsl="echo 'Stash list:'; git stash list; echo "-""
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
        git stash push --include-untracked --message "${stash_message}"
    fi
}

## Status
alias gs="git status --short --branch --untracked-files --show-stash"
alias gst="git status --untracked-files"

## Submodule
alias gsubir="git submodule update --init --recursive"
alias gsubr="git submodule update --recursive"

## Switch
alias gsm="git switch main"
alias gsd="git switch develop"
alias gsc="git switch --create"

## Outros
alias grb="git reset --soft HEAD~1" # desfaz ultimo commit e as alteracoes voltam pra staging area, sem alteracao
alias gus="git reset HEAD --" # volta o arquivo da staging area para working area, sem alterar o conteudo
alias gusa="git reset HEAD" # volta todos os arquivos da staging area para working area, sem alterar o conteudo
alias gud="git checkout --" # descarta as alteracoes de um arquivo e volta para a ultima versao comitada
alias guda="git checkout ." # descarta todas alteracoes e volta para a ultima versao comitada
