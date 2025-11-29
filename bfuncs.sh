
function confirm
{
    local prompt="$1"
    local answer

    while true; do
        printf "%s (Y/N): " "${prompt}" > /dev/tty

        # read a whole line from the terminal (portable: zsh & bash)
        IFS= read -r answer < /dev/tty || return 1

        case "${answer}" in
            [Yy]) return 0 ;;
            [Nn]) return 1 ;;
        esac
    done
}

function exit_ok
{
    exit ${EXIT_SUCCESS}
}

function exit_nok
{
    exit ${EXIT_ERROR}
}

# Git functions

function git_check_stagin_area_empty
{
    allow_empty_option=""
    if git diff --cached --quiet; then # staging area is empty
        if confirm "Staging area vazia, commitar mesmo assim?"; then
            allow_empty_option="--allow-empty"
        fi
    fi

    echo ${allow_empty_option}
}

function git_current_branch_name
{
    git rev-parse --abbrev-ref HEAD
}
