#!/bin/bash
# Run as `bash script/deploy.sh "optional commit message here"`

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo -s docs

# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master
git subtree push --prefix=docs/public git@github.com:pullapprove/support.git gh-pages
