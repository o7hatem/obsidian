---
tags:
  - git
---
# Logs
* `git log` - Shows the entire history for commits
- **`git log --oneline`** – Condenses each commit into a single, compact line (shows the abbreviated hash and the commit message).
- **`git log -n 5`** – Limits the output to the last **n** commits (e.g., the last 5 commits).
- **`git log --since="2026-01-01"`** – Filters history to show only commits made after a certain date. 
- **`git log --grep="bugfix"`** – Searches and filters commits by keywords in the commit message. 
* `git show COMMIT_HASH` To see the full commit details, author info, and the exact lines added or removed within the changed files
* `git show --name-only COMMIT_HASH` To see the file names along with a letter indicating _how_ they changed (**M**odified, **A**dded, **D**eleted)


# Stashing
In case there are remote commits that you need to pull into your local repo without losing the changes, you use `git stash`. Stashing saves your current changes, brining your local repo to the lastest state it had before the changes. Consequently, you can safely pull the remote commits. Afterwards, you pop the changes out of the stash stack. 

```git
git status
git stash push -u -m "Work PC changes before pulling updates"
git fetch origin
git pull --ff-only origin main
git stash pop
git status
```

* `-u` flag includes untracked files.
* `--ff-only` option prevents Git from creating an unexpected merge commit.

# Rebase
When you have local commits and want to pusll remote commits to your local repo, you can use rebase. Rebasing applies you commit ontop of the remote commits.
![[0203-git-merge-git-rebase.jpg|377]]


> [!NOTE] git rebase VS git pull --rebase
> `git pull --rebase` fetches remote commits first, then do the rebase. 

In case of a confilt, you need to open the file where the confilt happened, resolve the confile. Then, you add the file and continue the rebase.

```git
git add <resolved-file>
git rebase --continue
```

