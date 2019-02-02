#!/bin/bash

# # make a branch
git checkout -b $1;

CURRENT_BRANCH="$(git status --branch --porcelain | head -n 1 | sed 's/## //')"

# # check
if [ $CURRENT_BRANCH = $1 ] ; then
    # empty commit
    git commit --allow-empty -m "$1 init.";

    # log
    git log
else
    echo "Oh.. you can not make a branch :(";
fi