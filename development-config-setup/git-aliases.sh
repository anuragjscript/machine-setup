#!/bin/bash

# Checkout to branch x
git config --global alias.co checkout

# Git clean node_modules
git config --global alias.cnm '!git rm -rf --cached node_modules'

# Show a summarized git log
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

# Show the current git branch
git config --global alias.current "rev-parse --abbrev-ref HEAD"

# Show a list of aliases
git config --global alias.aliases "config --get-regexp alias"

# Show a detailed git status
git config --global alias.st "status -sb"

# Show the last commit
git config --global alias.last "log -1 HEAD"

# Show a list of branches
git config --global alias.branches "branch -a"

# Show a list of remote repositories
git config --global alias.remotes "remote -v"

# Add Git remove remote origin
git config --global alias.rm-remote '!f() { if [ -z "$1" ]; then git remote rm origin; else git remote rm "$1"; fi }; f'

# Show a list of staged files
git config --global alias.staged "diff --cached"

# Show a list of untracked files
git config --global alias.untracked "ls-files --others --exclude-standard"

# Amend the last commit
git config --global alias.amend "commit --amend --no-edit"

# Undo last commit
git config --global alias.undo "reset HEAD~1 --mixed"

# Push current branch to origin
git config --global alias.pusho "push -u origin HEAD"

# Pull from origin
git config --global alias.pullo "pull origin"

# Show a compact view of the git reflog
git config --global alias.reflog "reflog --pretty=oneline"

# Show a list of contributors
git config --global alias.contributors "shortlog -sn --no-merges"

# Show changes between two commits
git config --global alias.changes "diff --name-status"

# Show the diff of a file at a specific commit
git config --global alias.filediff "diff --find-renames --find-copies"

# Show the blame information for a file
git config --global alias.blame "blame -w"

# Show a compact view of the stash
git config --global alias.stashlist "stash list --pretty='%gd: %C(yellow)%cr%Creset %s %C(bold blue)<%an>%Creset'"

# Show the most recent stash
git config --global alias.laststash "stash show -p"

# Show the content of a stash
git config --global alias.showstash "stash show -p"

# Apply the most recent stash
git config --global alias.applystash "stash apply"

# Create and switch to a new branch
git config --global alias.newbr "checkout -b"

# Delete a branch locally and remotely
git config --global alias.delbr "!f() { git branch -d $1 && git push origin --delete $1; }; f"

# Add Commit & Message in one line
git config --global alias.acm '!f() { git add . && git commit -m "$1"; }; f'

# Set upstream branch
git config --global alias.pushup "!git push --set-upstream origin"

# Check if remote branch is present or not
git config --global alias.checkremote "!f() { git fetch origin && git branch --remotes | grep -q \"origin/$1\" && echo \"Branch '$1' exists in the remote repository\" || echo \"Branch '$1' does not exist in the remote repository\"; }; f"

# Check if local branch is present or not
git config --global alias.checklocal "!f() { git branch --list | grep -q \"$1\" && echo \"Branch '$1' exists locally\" || echo \"Branch '$1' does not exist locally\"; }; f"

# Add Delete File in one line
git config --global alias.clean-dry '!f() { git clean -n -d && read -p "Continue with deletion? (y/n): " response && if [ "$response" = "y" ]; then git clean -f -d; fi; }; f'

# Check if all commands were successful and display a message
if [ $? -eq 0 ]; then
    echo "All Git aliases added successfully."
else
    echo "Error occurred while adding Git aliases."
fi
