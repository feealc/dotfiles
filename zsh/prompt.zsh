
git_prompt_info2()
{
    # Check if we're in a git repository
    if git rev-parse --git-dir > /dev/null 2>&1; then
        local branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)

        # Check if there are uncommitted changes
        if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
            # Dirty - has changes
            # echo "%{$fg_bold[blue]%}(%{$fg[red]%}${branch}%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
            echo "%{$fg_bold[blue]%}(%{$fg[red]%}${branch}%{$fg[blue]%})%{$reset_color%}"
        else
            # Clean - no changes
            echo "%{$fg_bold[blue]%}(%{$fg[red]%}${branch}%{$fg[blue]%})%{$reset_color%}"
        fi
    fi
}

git_prompt_info3()
{
    if git rev-parse --git-dir > /dev/null 2>&1; then
        local branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
        local status=""

        # Check for various states
        if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
            status+="%{$fg[yellow]%}✗"  # Uncommitted changes
        fi

        # Check for untracked files
        if [[ -n $(git ls-files --others --exclude-standard 2>/dev/null) ]]; then
            status+="%{$fg[red]%}+"  # Untracked files
        fi

        # Check for stashed changes
        if git rev-parse --verify refs/stash >/dev/null 2>&1; then
            status+="%{$fg[cyan]%}$"  # Stashed changes
        fi

        # Construct the prompt
        echo "%{$fg_bold[blue]%}(%{$fg[red]%}${branch}%{$fg[blue]%})${status}%{$reset_color%}"
    fi
}

pyenv_prompt_info()
{
    if command -v pyenv &> /dev/null; then
        # local version=$(pyenv version-name 2>/dev/null)
        local version=$(echo ${PYENV_VERSION} 2>/dev/null)
        if [[ -n "${version}" && "${version}" != "system" ]]; then
            echo "(${version})"
        fi
    fi
}

PROMPT="%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} ) %{$fg[cyan]%}%~%{$reset_color%}"
PROMPT+=" $(pyenv_prompt_info)"
PROMPT+=" $(git_prompt_info2)"
# PROMPT+=$'\n%# '
PROMPT+=$'\n%{$fg_bold[yellow]%}✗%{$reset_color%} '

# RPROMPT="$(mom)"
