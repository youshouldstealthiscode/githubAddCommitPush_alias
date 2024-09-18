#!/bin/bash

# Default commit message if the user doesn't provide one
DEFAULT_MESSAGE="Auto-commit: default message"

# Function to ask for a commit message
get_commit_message() {
    read -p "Commit message? (Enter here, no need for quotation marks, I will add them if they are missing): " commit_message

    # If user doesn't provide a message, use the default message
    if [[ -z "$commit_message" ]]; then
        echo "$DEFAULT_MESSAGE"
    else
        echo "$commit_message"
    fi
}

# Main script execution

# Step 1: Add all changes to the staging area
echo "Adding all changes to the staging area..."
git add .

# Step 2: Get commit message
commit_message=$(get_commit_message)

# Step 3: Commit with the provided or default message
echo "Committing with message: \"$commit_message\""
git commit -m "$commit_message"

# Step 4: Push to the remote repository
# Ask for the branch name, default to "main" if not provided
read -p "Branch to push to? (Default: main): " branch
branch=${branch:-main}

# Push to the specified branch
echo "Pushing changes to the remote branch: $branch"
git push origin "$branch"

# Inform the user that the process is complete
echo "Git operations completed."
