
# Print with zsh foreground color
function color
{
    local col="$1"
    shift
    print -P "%F{$col}$*%f"
}

# Print with zsh background color
function bgcolor
{
    local col="$1"
    shift
    print -P "%K{$col}$*%k"
}

# Bold text
function bold
{
    print -P "%B$*%b"
}

# Predefined styles
function info
{
    print -P "%F{blue}$*%f"
}

function success
{
    print -P "%F{green}$*%f"
}

function warn
{
    print -P "%F{yellow}$*%f"
}

function error
{
    print -P "%F{red}$*%f" >&2
}

# Optional: reset (rarely needed)
function reset_color
{
    print -P "%f%k%b"
}
