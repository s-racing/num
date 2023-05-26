#!/bin/bash

# Name of the target branch (e.g., main)
target_branch="main"
branch_to_merge="one"

# Function to deploy changes to the web page
deploy_changes() {
  cd /var/www/html/num
  sudo rm -f index.html
  cd /var/lib/jenkins/workspace/new
  sudo cp -R * /var/www/html/num/
}

# Get the current branch name
current_branch=$(git rev-parse --abbrev-ref HEAD)

# Merge the branch into the target branch
if [[ "$current_branch" = "$branch_to_merge" ]]; then
  git checkout "$target_branch" && git merge --no-ff "$branch_to_merge"

  # Check if the merge was successful
  if [ $? -eq 0 ]; then
    # Deploy changes if merged successfully
    deploy_changes
  else
    echo "Merge failed. Changes will not be deployed."
  fi
fi

# Deploy changes if the current branch is the target branch
if [[ "$current_branch" = "$target_branch" ]]; then
  deploy_changes
fi
