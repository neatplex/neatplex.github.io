#!/bin/bash

# Define the target branch
TARGET_BRANCH="master"

# Fetch the latest changes and switch to the target branch
git fetch origin
git checkout $TARGET_BRANCH
git pull origin $TARGET_BRANCH

# Calculate the commit hash that is 5000 commits old
COMMIT_HASH=$(git log --format="%H" | tail -n 5000 | head -n 1)

# Start automated rebase with auto-squashing, but ensure the first commit remains with 'pick'
GIT_SEQUENCE_EDITOR='sed -i -re "1,/^pick $COMMIT_HASH$/!s/pick/squash/"' git rebase -i --autosquash $COMMIT_HASH~1

# Check if there are any conflicts
if [ $? -eq 0 ]
then
    echo "Rebase completed successfully."
else
    echo "Rebase encountered conflicts. Please resolve them and run 'git rebase --continue'."
fi
