singularity run \
    --contain \
    $(if lspci | grep -qi nvidia; then echo ' --nv'; else echo ''; fi) \
    $(if [ -f "${HOME}/.gitconfig" ]; then echo ' --bind='${HOME}'/.gitconfig'; else echo ''; fi) \
    $(if [ -f "${HOME}/.vimrc" ]; then echo ' --bind='${HOME}'/.vimrc'; else echo ''; fi) \
    --bind=/etc/hosts \
    --bind=/etc/localtime \
    --workdir=workdir \
    --bind=/proc \
    --bind=/sys \
    --bind=/dev \
    --bind=scripts:/scripts \
    --bind=/run/user/${UID} \
    --bind=$HOME/.ssh \
    --home=home:${HOME} \
    -B /tmp \
    isaac


