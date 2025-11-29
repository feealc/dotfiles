
alias pea="pyenv activate"
alias ped="pyenv deactivate"
alias pel="pyenv virtualenvs"

function peh
{
    echo "pyenv - versao python: pyenv install|uninstall 3.12.1"
    echo "pyenv - ativar versao python: pyenv global 3.12.1|system"
    echo "pyenv - criar virtualenv: pyenv virtualenv <versao_python> <nome>"
    echo "pyenv - ativar virtualenv: pyenv activate <nome>"
    echo "pyenv - desativar virtualenv: pyenv deactivate"
}
