#!/bin/bash

# Name of the target branch (e.g., main)
target_branch="main"
branch_to_merge="one"

# Deploy the changes if the current branch is the target branch
if [[ "$(git symbolic-ref --short HEAD)" = "$target_branch" ]]; then
  cd /var/www/html/num
  sudo rm -f index.html
  cd /var/lib/jenkins/workspace/new
  sudo cp -R * /var/www/html/num/
fi

# Merge the branch into the target branch
if [[ "$(git symbolic-ref --short HEAD)" = "$branch_to_merge" ]]; then
  git checkout "$target_branch" && git merge --no-ff "$branch_to_merge"
fi

# Deploy the changes to the web page after merging into the target branch
if [[ "$(git symbolic-ref --short HEAD)" = "$target_branch" ]]; then
  cd /var/www/html/num
  sudo rm -f index.html
  cd /var/lib/jenkins/workspace/new
  sudo cp -R * /var/www/html/num/
fi
