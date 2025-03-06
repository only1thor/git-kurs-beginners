#!/bin/bash

# Create a unique temporary directory for both repositories
temp_dir=$(mktemp -d -t repos-XXXXXXXXXX)

# Untar the repository into the temporary directory
tar -xvf media/repo.tar -C "$temp_dir"

# Get the directory name of the untarred repo
REPO_NAME=$(basename $(tar -tf media/repo.tar | head -1))

# Path to the untarred repository
untarred_repo="$temp_dir/$REPO_NAME"

# Path to the remote bare repository
remote_repo="$temp_dir/remote_repo"

# Create a bare repository in the same temporary directory
git init --bare "$remote_repo"

# Change to the untarred repository directory
cd "$untarred_repo"

# Add the bare repo as remote origin
git remote add origin "$remote_repo"

# Push all branches and tags to the new remote repository
git push origin --all
git push origin --tags

echo "set -gx GV $PWD/vis.sh" | fish

# Output the paths for reference
echo "Temporary directory: $temp_dir"
echo "Untarred repository: $untarred_repo"
echo "Remote repository: $remote_repo"
