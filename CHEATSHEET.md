# Git Aliases Cheatsheet

This cheatsheet provides a comprehensive list of all Git aliases available in PowerShell after installing the PowerShell-Git-Aliases script.

## Basic Commands

| Alias | Git Command | Description |
|-------|------------|-------------|
| `g` | `git` | Short alias for the git command |
| `gst` | `git status` | Shows the working tree status |
| `ga` | `git add` | Add file contents to the index |
| `gaa` | `git add --all` | Add all files to the index |
| `gau` | `git add --update` | Add modified and deleted files to the index |
| `gav` | `git add --verbose` | Add with verbose output |
| `gap` | `git add --patch` | Add interactively |
| `gapa` | `git add --patch` | Add interactively (same as gap) |

## Branch Operations

| Alias | Git Command | Description |
|-------|------------|-------------|
| `gb` | `git branch` | List, create, or delete branches |
| `gba` | `git branch --all` | List both remote and local branches |
| `gbd` | `git branch --delete` | Delete a branch |
| `gbD` | `git branch --delete --force` | Force delete a branch |
| `gbr` | `git branch --remote` | List remote branches |
| `gbm` | `git branch --move` | Move/rename a branch |
| `gbnm` | `git branch --no-merged` | List branches that have not been merged |
| `gbg` | `LANG=C git branch -vv \| grep ": gone\]"` | Show local branches tracking deleted remote branches |
| `gbgd` | (complex) | Delete all local branches tracking deleted remote branches |
| `gbgD` | (complex) | Force delete all local branches tracking deleted remote branches |

## Checkout Operations

| Alias | Git Command | Description |
|-------|------------|-------------|
| `gco` | `git checkout` | Switch branches or restore files |
| `gcb` | `git checkout -b` | Create and switch to a new branch |
| `gcm` | `git checkout $(git_main_branch)` | Switch to the main branch |
| `gcd` | `git checkout $(git_develop_branch)` | Switch to the develop branch |
| `gcor` | `git checkout --recurse-submodules` | Checkout with submodule update |
| `gcB` | `git checkout -B` | Create/reset branch and switch to it |

## Commit Operations

| Alias | Git Command | Description |
|-------|------------|-------------|
| `gc` | `git commit --verbose` | Record changes with verbose output |
| `gc!` | `git commit --verbose --amend` | Amend the previous commit |
| `gca` | `git commit --verbose --all` | Commit all tracked files |
| `gca!` | `git commit --verbose --all --amend` | Amend with all tracked files |
| `gcam` | `git commit --all --message` | Commit all tracked files with message |
| `gcmsg` | `git commit --message` | Commit with message |
| `gcn` | `git commit --verbose --no-edit` | Commit with previous message |
| `gcn!` | `git commit --verbose --no-edit --amend` | Amend without changing the message |
| `gcan!` | `git commit --verbose --all --no-edit --amend` | Amend all tracked without changing message |
| `gcann!` | `git commit --verbose --all --date=now --no-edit --amend` | Amend all tracked with current date |
| `gcas` | `git commit --all --signoff` | Commit all tracked with signoff |
| `gcasm` | `git commit --all --signoff --message` | Commit all tracked with signoff and message |
| `gcs` | `git commit --gpg-sign` | Commit GPG signed |
| `gcss` | `git commit --gpg-sign --signoff` | Commit GPG signed with signoff |
| `gcssm` | `git commit --gpg-sign --signoff --message` | Commit GPG signed with signoff and message |

## Diff Commands

| Alias | Git Command | Description |
|-------|------------|-------------|
| `gd` | `git diff` | Show changes between commits, commit and working tree, etc |
| `gdca` | `git diff --cached` | Show changes between index and HEAD |
| `gdcw` | `git diff --cached --word-diff` | Show cached changes with word diff |
| `gds` | `git diff --staged` | Show changes between index and HEAD (same as gdca) |
| `gdw` | `git diff --word-diff` | Show word diff |
| `gdup` | `git diff @{upstream}` | Show diff between current branch and upstream |
| `gdct` | `git describe --tags $(git rev-list --tags --max-count=1)` | Show the most recent tag |

## Fetch Commands

| Alias | Git Command | Description |
|-------|------------|-------------|
| `gf` | `git fetch` | Download objects and refs from another repository |
| `gfa` | `git fetch --all --tags --prune --jobs=10` | Fetch from all remotes, prune, and get all tags |
| `gfo` | `git fetch origin` | Fetch from origin |

## Log Commands

| Alias | Git Command | Description |
|-------|------------|-------------|
| `glg` | `git log --stat` | Show commit logs with stats |
| `glgg` | `git log --graph` | Show commit logs as a graph |
| `glgga` | `git log --graph --decorate --all` | Show all commit logs as a decorated graph |
| `glgm` | `git log --graph --max-count=10` | Show last 10 commits as a graph |
| `glo` | `git log --oneline --decorate` | Show logs one line per commit |
| `glog` | `git log --oneline --decorate --graph` | Show log as a graph with decorations |
| `gloga` | `git log --oneline --decorate --graph --all` | Show all logs as a decorated graph |
| `glol` | `git log --graph --pretty="%C(red)%h%C(reset) -%C(auto)%d%C(reset) %s %C(green)(%ar) %C(bold blue)<%an>%C(reset)"` | Custom pretty log format |
| `glola` | `git log --graph --pretty=... --all` | Custom pretty log for all refs |
| `glols` | `git log --graph --pretty=... --stat` | Custom pretty log with stats |
| `glod` | `git log --graph --pretty=...` | Custom pretty log by date |
| `glods` | `git log --graph --pretty=... --date=short` | Custom pretty log with short date |

## Pull Commands

| Alias | Git Command | Description |
|-------|------------|-------------|
| `gl` | `git pull` | Fetch and integrate with current branch |
| `gpr` | `git pull --rebase` | Pull with rebase instead of merge |
| `gpra` | `git pull --rebase --autostash` | Pull with rebase and autostash |
| `gprav` | `git pull --rebase --autostash -v` | Pull with rebase, autostash, and verbose output |
| `gprom` | `git pull --rebase origin $(git_main_branch)` | Pull and rebase from origin main branch |
| `gpromi` | `git pull --rebase=interactive origin $(git_main_branch)` | Interactive rebase from origin main |
| `ggpull` | `git pull origin "$(git_current_branch)"` | Pull from origin current branch |

## Push Commands

| Alias | Git Command | Description |
|-------|------------|-------------|
| `gp` | `git push` | Update remote refs along with associated objects |
| `gpd` | `git push --dry-run` | Dry run push (show what would be pushed) |
| `gpf` | `git push --force-with-lease --force-if-includes` | Safer force push |
| `gpf!` | `git push --force` | Force push (use with caution) |
| `ggpush` | `git push origin "$(git_current_branch)"` | Push current branch to origin |
| `gpsup` | `git push --set-upstream origin $(git_current_branch)` | Push and set upstream |
| `gpsupf` | `git push --set-upstream origin $(git_current_branch) --force-with-lease` | Force push and set upstream |
| `gpoat` | `git push origin --all; git push origin --tags` | Push all and push all tags to origin |
| `gpu` | `git push upstream` | Push to upstream |
| `gpv` | `git push --verbose` | Push with verbose output |

## Rebase Commands

| Alias | Git Command | Description |
|-------|------------|-------------|
| `grb` | `git rebase` | Reapply commits on top of another base tip |
| `grba` | `git rebase --abort` | Abort a rebase in progress |
| `grbc` | `git rebase --continue` | Continue a rebase after resolving conflicts |
| `grbs` | `git rebase --skip` | Skip the current patch |
| `grbi` | `git rebase --interactive` | Interactive rebase |
| `grbm` | `git rebase $(git_main_branch)` | Rebase on main branch |
| `grbd` | `git rebase $(git_develop_branch)` | Rebase on develop branch |
| `grbom` | `git rebase origin/$(git_main_branch)` | Rebase on origin main branch |
| `grbum` | `git rebase upstream/$(git_main_branch)` | Rebase on upstream main branch |

## Reset and Restore Commands

| Alias | Git Command | Description |
|-------|------------|-------------|
| `grh` | `git reset` | Reset current HEAD to specified state |
| `grhh` | `git reset --hard` | Reset hard (discard all changes) |
| `grhs` | `git reset --soft` | Reset soft (keep changes in staging) |
| `grhk` | `git reset --keep` | Reset keep (discard uncommitted changes) |
| `groh` | `git reset origin/$(git_current_branch) --hard` | Reset hard to origin |
| `gru` | `git reset --` | Reset path to the index version |
| `grs` | `git restore` | Restore working tree files |
| `grst` | `git restore --staged` | Unstage files |
| `grss` | `git restore --source` | Restore from a source |

## Remote Commands

| Alias | Git Command | Description |
|-------|------------|-------------|
| `gr` | `git remote` | Manage set of tracked repositories |
| `gra` | `git remote add` | Add a new remote |
| `grmv` | `git remote rename` | Rename a remote |
| `grrm` | `git remote remove` | Remove a remote |
| `grset` | `git remote set-url` | Change remote URL |
| `grup` | `git remote update` | Fetch updates for all remotes |
| `grv` | `git remote --verbose` | List remotes verbosely |

## Stash Commands

| Alias | Git Command | Description |
|-------|------------|-------------|
| `gsta` | `git stash push` | Stash changes |
| `gstaa` | `git stash apply` | Apply stashed changes |
| `gstall` | `git stash --all` | Stash all tracked and untracked files |
| `gstc` | `git stash clear` | Clear all stashes |
| `gstd` | `git stash drop` | Drop a stash |
| `gstl` | `git stash list` | List stashes |
| `gstp` | `git stash pop` | Pop stashed changes |
| `gsts` | `git stash show --patch` | Show stash changes |
| `gstu` | `git stash push --include-untracked` | Stash including untracked files |

## Miscellaneous Commands

| Alias | Git Command | Description |
|-------|------------|-------------|
| `gbl` | `git blame -w` | Show what revision changed each line of a file |
| `gbs` | `git bisect` | Find by binary search the commit that introduced a bug |
| `gbsb` | `git bisect bad` | Mark the current revision as bad |
| `gbsg` | `git bisect good` | Mark the current revision as good |
| `gbsr` | `git bisect reset` | Reset bisect state |
| `gbss` | `git bisect start` | Start a bisect session |
| `gcf` | `git config --list` | List all variables set in config file |
| `gcl` | `git clone --recurse-submodules` | Clone a repository including all submodules |
| `gclean` | `git clean --interactive -d` | Interactive removal of untracked files |
| `gcount` | `git shortlog --summary --numbered` | Count commits by author |
| `gcp` | `git cherry-pick` | Apply the changes introduced by existing commits |
| `gcpa` | `git cherry-pick --abort` | Abort a cherry-pick |
| `gcpc` | `git cherry-pick --continue` | Continue a cherry-pick |
| `gfg` | `git ls-files \| grep` | Find files matching pattern in git repository |
| `gignore` | `git update-index --assume-unchanged` | Ignore changes to a file |
| `gunignore` | `git update-index --no-assume-unchanged` | Unignore changes to a file |
| `grt` | `Set-Location (git rev-parse --show-toplevel)` | Navigate to the git root directory |
| `gsh` | `git show` | Show various types of objects |
| `gss` | `git status --short` | Show the working tree status in short format |
| `gsb` | `git status --short --branch` | Show the working tree status with branch info |
| `gsi` | `git submodule init` | Initialize submodules |
| `gsu` | `git submodule update` | Update submodules |
| `gsw` | `git switch` | Switch to a branch |
| `gswc` | `git switch --create` | Create and switch to a new branch |
| `gswm` | `git switch $(git_main_branch)` | Switch to main branch |
| `gwip` | Complex | Save work in progress commit |
| `gunwip` | Complex | Undo the last WIP commit |

---

## Helper Functions

| Function | Description |
|----------|-------------|
| `git_current_branch` | Get the name of the current branch |
| `git_main_branch` | Get the name of the main branch (main or master) |
| `git_develop_branch` | Get the name of the develop branch (develop or dev) |
