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

    read -p "Push? (y/n): " answer
    case "$answer" in 
        [yY]*) git push origin HEAD; hub pull-request -m "$1" -l meeting task: feature -a ayanakahara -F - --edit < ../auto_initial_commit/.github/PULL_REQUEST_TEMPLATE.md -o;;
        
        *) echo "no push." ; exit ;; 
    esac

else
    echo "Oh.. you can not make a branch :(";
fi