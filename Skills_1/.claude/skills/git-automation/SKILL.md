---
name: git-automation
description: Analyze changes, generate conventional commit messages, and push to specific branches (main/dev/current).
allowed-tools: Bash
model: sonnet
---

# Git Automation Workflow

## Make  Commit and Push

When the user asks to "save changes," "push," or "commit":

1.  **Identify Target Branch**:
    *   If the user specifies a branch (e.g., "push to main" or "to dev"), use that branch.
    *   If no branch is specified, determine the current branch using `git branch --show-current`.

2.  **Stage and Analyze**:
    *   Run `git add .` to stage all changes.
    *   Run `git diff --cached` to inspect the staged changes for context.

3.  **Generate Commit Message**:
    *   Create a concise commit message following the **Conventional Commits** standard (e.g., `feat:`, `fix:`, `docs:`, `refactor:`, `chore:`).
    *   Ensure the message accurately reflects the technical changes detected in the diff.

4.  **Execute Workflow**:
    Run the following sequence:
    ```bash
    git commit -m "<your_generated_message>"
    git push origin <target_branch>
    ```

## Usage Examples:
- "Push to main" -> (Stages changes, generates name, pushes to **main**)
- "Commit changes to dev" -> (Stages changes, generates name, pushes to **dev**)
- "Push my code" -> (Stages changes, generates name, pushes to **current active branch**)

## Generate Changelog
When the user asks to "update changelog," "generate changelog," or as part of a push workflow:

1. **Run the script**:
```bash
   bash scripts/generate-changelog.sh
```
2. **Stage and commit the result**:
```bash
   git add CHANGELOG.md
   git commit -m "docs: update changelog"
   git push origin 
```

## Extended Push Workflow (with Changelog)
When the user says "push with changelog" or "full push":
1. Run `generate-changelog.sh`
2. Stage all changes including `CHANGELOG.md`
3. Generate conventional commit message for original changes
4. Push everything in one commit

## Usage Examples (extended):
- "Update changelog" → runs script, commits `CHANGELOG.md`
- "Push with changelog to main" → full workflow, pushes to **main**

---
