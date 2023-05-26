#!/bin/bash

# Name of the target branch (e.g., main)
target_branch="main"

# Function to deploy changes to the web page
deploy_changes() {
  cd /var/www/html/num
  sudo rm -f index.html
  cd /var/lib/jenkins/workspace/new
  sudo cp -R * /var/www/html/num/
}

# Check if the current branch is the target branch
if [[ "$(git rev-parse --abbrev-ref HEAD)" = "$target_branch" ]]; then
  echo "Deploying changes..."
  deploy_changes
else
  echo "Current branch is not '$target_branch'. Changes will not be deployed."
fi
