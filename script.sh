#!/bin/bash

# Define the branch name to check
branch_name="one"

# Check if the branch has been merged
is_merged=$(git branch --merged | grep "$branch_name")

# Check if the branch has not been merged
if [ -z "$is_merged" ]; then
  echo "The branch '$branch_name' has not been merged."
else
  cd /var/www/html/num
  sudo rm -f index.html
  cd /var/lib/jenkins/workspace/new
  sudo cp -R * /var/www/html/num/
  
fi
