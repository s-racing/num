#!/bin/bash

# Name of the target branch (e.g., main)
target_branch="main"

# Deploy the changes if the current branch is the target branch
if [[ "$(git symbolic-ref --short HEAD)" = "$target_branch" ]]; then
  cd /var/www/html/num
  sudo rm -f index.html
  cd /var/lib/jenkins/workspace/new
  sudo cp -R * /var/www/html/num/
fi

# Merge the branch into the target branch
git checkout "$target_branch" && git merge --no-ff "three"
