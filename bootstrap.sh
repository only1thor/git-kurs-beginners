#!/bin/bash


# Create a unique temporary directory for both repositories
temp_dir=$(mktemp -d -t repos-XXXXXXXXXX)
mkdir -p "$temp_dir/git_repo"
mkdir -p "$temp_dir/remote_repo"

# Untar the repository into the temporary directory
tar -xf media/repo.tar -C "$temp_dir/git_repo"

# Path to the untarred repository
untarred_repo="$temp_dir/git_repo"

# Path to the remote bare repository
remote_repo="$temp_dir/remote_repo"

# Create a bare repository in the same temporary directory
git init --bare "$remote_repo"

# copy vis.sh to the temporary directory
cp vis.sh "$temp_dir"

# Set the absolute path of vis.sh as a variable
VIS_PATH="$temp_dir/vis.sh"

# Change to the untarred repository directory
cd "$untarred_repo"

# Add the bare repo as remote origin
git remote add origin "$remote_repo"

# Push all branches and tags to the new remote repository
git push origin --all
git push origin --tags

# Output the paths for reference
echo "Temporary directory: $temp_dir"
echo "Untarred repository: $untarred_repo"
echo "Remote repository: $remote_repo"

# Change to the untarred repository directory
cd "$untarred_repo"

# Start tmux session
tmux new-session -d -s repo_session

# Set initial pane to the untarred repository
tmux send-keys -t repo_session:0.0 "function fish_prompt
    fish_git_prompt
  end;
  set fish_autosuggestion_enabled 0;
  clear" C-m

# Create the left pane with vis.sh
tmux split-window -h -t repo_session:0.0
tmux send-keys -t repo_session:0.1 "bash $VIS_PATH" C-m

# Create the bottom-left pane with a shell with micro
tmux split-window -v -t repo_session:0.0
tmux send-keys -t repo_session:0.1 "micro Readme.md" C-m

# Attach to the tmux session
tmux attach-session -t repo_session
