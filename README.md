# githubAddCommitPush_alias
script that automates github add, commit, and push

Here’s a Bash script that can automate the sequence of `git add`, `git commit`, and `git push` based on user inputs. The script will prompt the user for a commit message and, if none is entered, it will use a default message.

You can also tie this script to an alias for quick use.

### **Bash Script: `gitAddCommitPush.sh`**

```bash
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
```

### **How to Set Up and Use the Script**

1. **Save the Script:**
   - Save the script to a file called `git_auto_push.sh` in your preferred directory (e.g., `~/scripts`).

2. **Make the Script Executable:**
   - Run the following command to make the script executable:

     ```bash
     chmod +x ~/scripts/git_auto_push.sh
     ```

3. **Create an Alias for Quick Access:**
   - To tie the script to a Git alias, add the following line to your `.bashrc` (or `.zshrc` if you're using Zsh) for quick access:

     ```bash
     alias gitpush="~/scripts/git_auto_push.sh"
     ```

   - After adding the alias, reload your shell configuration by running:

     ```bash
     source ~/.bashrc  # or source ~/.zshrc for Zsh
     ```

4. **Run the Script:**
   - From any Git repository, you can now run the following command to perform the sequence of actions:

     ```bash
     gitpush
     ```

### **What the Script Does:**
- **Step 1**: Adds all changes (new, modified, or deleted files) to the staging area using `git add .`.
- **Step 2**: Prompts the user for a commit message. If no message is entered, a default message (`Auto-commit: default message`) is used.
- **Step 3**: Commits the changes with the provided or default commit message.
- **Step 4**: Asks the user for the branch name to push the changes to. If no branch is entered, it defaults to `main`. The script then pushes the changes using `git push origin branch_name`.

### **Additional Notes:**
- **Default Branch**: The script will push to `main` if no branch is specified. You can change this default in the script or modify it when prompted.
- **Commit Message**: The script automatically adds quotation marks to the commit message if the user forgets them, simplifying the input process.
  
This will streamline your Git workflow! Let me know if you need any further customization or explanation.
