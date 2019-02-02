#!/bin/bash

# # make a branch
git checkout -b $1;

CURRENT_BRANCH="$(git status --branch --porcelain | head -n 1 | sed 's/## //')"

# # check
if [ $CURRENT_BRANCH = $1 ] ; then
    # empty commit
    if [ $2 ] ; then
        git commit --allow-empty -m "$2";
    else
        git commit --allow-empty -m "$1 init.";
    fi

    # log
    git log
else
    echo "Oh.. you can not make a branch :(";
fi