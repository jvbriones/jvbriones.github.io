---
sidebar_position: 30
---

# Git config

### Sign commits

[docu](https://docs.github.com/en/authentication/managing-commit-signature-verification/checking-for-existing-gpg-keys)

### Initial config

- set remote connection via ssh (no https)

``` bash
git remote set-url origin [git@gitlab.com (mailto:git@gitlab.com):project/file.git
```

- set global info

``` bash
git config --global user.name "Bob Doe"
git config --global user.email "[bob.doe@doe.org](mailto:bob.doe@doe.org)" (--local for a specific repo)
```

- set prune as default

``` bash
git config --global fetch.prune true
```

### Check config

- check SSH connection

``` bash
ssh -Tv user.name@email.com
```

- check git config

``` bash
git config --list
git config --local user.email (check the email for the current repo)
```

### Ignore .DS_Store files globaly

``` bash
git config --global core.excludesfile ~/.gitignore
echo .DS_Store >> ~/.gitignore
```

### Skip committing a file but getting the remote changes

``` bash
git update-index --skip-worktree core/config/config.cfg
```
