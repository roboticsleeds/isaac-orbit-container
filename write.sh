#!/bin/bash
singularity shell --fakeroot \
    --writable \
    --home=home:$HOME \
    $(if [ -f "${HOME}/.gitconfig" ]; then echo ' --bind='${HOME}'/.gitconfig'; else echo ''; fi) \
    $(if [ -f "${HOME}/.vimrc" ]; then echo ' --bind='${HOME}'/.vimrc'; else echo ''; fi) \
    --bind=/dev \
    isaac

