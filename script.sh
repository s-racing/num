#!/bin/bash

# Name of the target branch (e.g., main)
target_branch="main"

# Check if the current branch is the same as the branch to merge
if [[ "$(git symbolic-ref --short HEAD)" = "three" ]]; then
  # If the current branch is the branch to merge, merge it into the target branch
  git checkout "$target_branch" && git merge --no-ff "three"

  # If the merge was successful, deploy the changes
  if [ $? -eq 0 ]; then
    cd /var/www/html/num
    sudo rm -f index.html
    cd /var/lib/jenkins/workspace/new
    sudo cp -R * /var/www/html/num/
  else
    echo "Merge failed. Please resolve conflicts manually."
  fi
fi
