---
sidebar_position: 10
---

# Git config

### SSH keys

Created a new SSH key for the new machine to configure Git to use it for both GitHub authentication and commit signing, so we can securely push code and produce verified signed commits.


### Initial config

- set global identity

``` bash
git config --global user.name "Bob Doe"
git config --global user.email "[bob.doe@doe.org](mailto:bob.doe@doe.org)" (--local for a specific repo)
```

- set some defaults

``` bash
git config --global init.defaultBranch main
git config --global fetch.prune true
git config --global push.autoSetupRemote true // to avoid "git push -u origin my-branch"
git config --global pull.rebase false
git config --global core.excludesfile ~/.gitignore_global
git config --global gpg.format ssh
git config --global user.signingkey ~/.ssh/id_ed25519.pub
git config --global commit.gpgsign true
git config --global tag.gpgsign true
```

- set remote connection via ssh (no https)

``` bash
git remote set-url origin [git@gitlab.com (mailto:git@gitlab.com):project/file.git
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
git config --global core.excludesfile ~/.gitignore_global
cat >> ~/.gitignore_global <<'EOF' .DS_Store .env .env.local .env.production EOF
```

### Skip committing a file but getting the remote changes

``` bash
git update-index --skip-worktree core/config/config.cfg
```
