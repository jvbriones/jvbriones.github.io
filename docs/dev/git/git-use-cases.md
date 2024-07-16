---
sidebar_position: 10
---

# Git use cases

### Git Branches

- list local and remote branches

``` bash
git branch -av
```

- create and push a new branch

``` bash
git checkout -b new-branch
git push -u origin new-branch
```

- delete a branch

``` bash
git branch -d branch-name (delete it locally)
git push origin:branch-name (delete it on the remote repo)
```

- delete all **gone** branches

``` bash
git pull --prune
git branch -vv | grep ': gone]'| grep -v "\*" | awk '{ print $1; }' | xargs -r git branch -D`
```

### Local Changes

- stash local changes

``` bash
git stash
git stash pop (retrieve the last entry)
...
git stash list
git stash apply stash@{2}
```

- commit local changes

``` bash
git add -A
git commit -am “chore(ticket): description...”
...
git pull –rebase
git push
```

- change previous local commit

``` bash
git commit --amend -m "feat: description..."
```

- retroactively sign all past commits

``` bash
git rebase --exec "git commit --amend --no-edit -n -S" -i <branch you originally branched off>
```

- merge changes from main

``` bash
git fetch
git merge origin/main
```

### Merge conflict

If I have a merge conflict, instead of hitting that conflict through ~10 commits, I'd rather squash the branch and hit it once.

- reset merge when many conflicts

``` bash
git reset HEAD --hard
git reset HEAD~. (undo last commit)
```

### Git Tags

- see tags

``` bash
git pull --prune --tags
git tag
```

- create local tag

:::caution
Ensure the tag does not exist in the remote repository
:::

``` bash
git tag -s v0.18.14 -m "Add possibility to cache node unit tests"
```

- delete local tag

``` bash
git tag -d v0.18.14
```

- push tags

``` bash
git push --tags
```
