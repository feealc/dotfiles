
# criar um alias no .bashrc do windows pra executar esse shell sempre que precisar
# antes de executar os comandos, apagar o arquivo .gitconfig pra garantir que não vai ficar nenhuma config
# utilizar essa opcao no git-checkout pra não precisar colocar o nome da branch no pull
    # git config --global pull.default current
    # git config --global --unset pull.default
# listar todas as configs no final
    # git --no-pager config --global --list

set -euo pipefail

GITCONFIG_FILE="${HOME}/.gitconfig"

if [[ -e ${GITCONFIG_FILE} ]]; then
    echo "Removing current .gitconfig file..."
    rm -rf ${GITCONFIG_FILE}
fi

echo "Applying Git global configuration..."

#

# [user]
git config --global user.name "Fernando Brum de Alcantara"
git config --global user.email "fernandobalcantara@gmail.com"
# git config --global user.signingkey "E3DFEC736900FDE2"

#
# set +e
git config --global --unset credential.helper || true
# set -e
git config --global credential.helper store

# [commit]
# git config --global commit.gpgSign true
# git config --global commit.template "~/.config/git/template"
# git config --global commit.verbose true

# [core]
# git config --global core.autocrlf input
# git config --global core.compression 9
# git config --global core.fsync none
# git config --global core.whitespace error
# git config --global core.preloadindex true
git config --global core.pager ""

# [advice]
git config --global advice.addEmptyPathspec false
git config --global advice.pushNonFastForward false
git config --global advice.statusHints false

# [blame]
git config --global blame.coloring highlightRecent
# git config --global blame.date relative
git config --global color.blame.highlightRecent "black bold,1 year ago,white,1 month ago,default,7 days ago,blue"

# [diff]
git config --global diff.context 3
git config --global diff.renames copies
git config --global diff.interHunkContext 5

# [init]
# git config --global init.defaultBranch dev

# [log]
# git config --global log.abbrevCommit true
# git config --global log.graphColors "blue,yellow,cyan,magenta,green,red"

# [status]
git config --global status.branch true
# git config --global status.short true
git config --global status.showStash true
git config --global status.showUntrackedFiles all

# [pager]
# git config --global pager.branch false
# git config --global pager.tag false
# git config --global pager.diff "diff-so-fancy | \$PAGER"

# [push]
git config --global push.autoSetupRemote true
# git config --global push.default current
# git config --global push.followTags true
# git config --global push.gpgSign false

# [pull]
# git config --global pull.rebase true
# git config --global pull.default current

# [submodule]
# git config --global submodule.fetchJobs 16

# [rebase]
# git config --global rebase.autoStash true
# git config --global rebase.missingCommitsCheck warn

# [pack]
# git config --global pack.threads 0
# git config --global pack.windowMemory 1g
# git config --global pack.packSizeLimit 1g

# Integrity checks
# git config --global transfer.fsckObjects true
# git config --global receive.fsckObjects true
# git config --global fetch.fsckObjects true

# [branch]
git config --global branch.sort -committerdate

# [tag]
git config --global tag.sort -taggerdate

# Colors: branch
# git config --global color.branch.current magenta
# git config --global color.branch.local default
# git config --global color.branch.remote yellow
# git config --global color.branch.upstream green
# git config --global color.branch.plain blue

# Colors: diff
# git config --global color.diff.meta "black bold"
# git config --global color.diff.frag magenta
# git config --global color.diff.context white
# git config --global color.diff.whitespace "yellow reverse"
# git config --global color.diff.old red

# Colors: decorate
# git config --global color.decorate.HEAD red
# git config --global color.decorate.branch blue
# git config --global color.decorate.tag yellow
# git config --global color.decorate.remoteBranch magenta

# [interactive]
# git config --global interactive.diffFilter "diff-so-fancy --patch"
# git config --global interactive.singlekey true

# URL shortcuts
# git config --global url."git@github.com:".insteadOf "gh:"
# git config --global url."git@github.com:codingjerk/".insteadOf "cj:"
# git config --global url."ssh://git@git.qrator.net:2202/radar/".insteadOf "radar:"

#

echo "Listing all configs..."
echo

echo "====="
git config --global --list
echo "====="
