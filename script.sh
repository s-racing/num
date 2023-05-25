#!/bin/bash

# Check to see if the current branch is the same as the branch that was merged
if [[ $GIT_MERGE_HEAD != $three ]]; then

  # If the current branch is not the same as the branch that was merged, then deploy the changes
  cd /var/www/html/num
  sudo rm -f index.html
  cd /var/lib/jenkins/workspace/new
  sudo cp -R * /var/www/html/num/

fi
