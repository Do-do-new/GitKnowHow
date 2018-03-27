# Git notes

Notes from git presentation from Alexander Groß. AGROSS on GitHub.
***AUTOMAGICALLY***
*Note:* where further `<SHA>` is specified in the command, normally branch name or HEAD is also possible.

## Config

**3 levels:** System + global + Repo
`git config --list` can be used to show aggreageted config frol all 3 levels

`credential.helper wincred` in the settings to use wincred instead of specifying proxy password explicitly!

## Index

`git add --update` add only changed, not new files

## Diff

`log -M10%`     similarity index (default till 50%)
`log --follow`  follow renames when showing history

## Ignore

Unignoring folder/file on lower level (for example, to add one bin folder or one exe)

## Cleaning

`git clean -n` remove only untracked files
`git clean -ndx`  Extra tools

## Viewing

`git reflog <branchName>` or even `HEAD` to show how branch ponter / HEAD was moving. *Can be used to see how rebase works!!!*
`git fsck --unreachable --no-reflogs` to show unreachables

`cd -` to go to previous dir
`git checkout -` to go to previous branch

`git show <SHA>:<fileName>` shows file state at certain branch/commit

`git log <SHA1>:<SHA2>`   delta between branches starting back from specified commits. Usually used with branch names in place of SHAs.
                        Then shows which commits are in the second branch but not in the first.

`git diff <SHA1>:<SHA2>` diff between commits. **Can be used also to compare branch tips!!!**

`git difftool --dir-diff` **`--dir-diff` to show dir diff!!!**

`git log --reverse` --reverse the order!

## Manipulating

`git filter-branch` NUCLEAR

`git reverst SHA`

`git merge --ff-only` (not onl `--no-ff` useful!)

`git checkout --conflict merge <fileName>` - mark file as not merged

`git checkout --ours <fileName>` (or `--theirs`)

*Note (approach):* starting temporary branch for merging, then either fast-forward or REused REcorderd Resolutions (`git rerere`, disabled by default)

`git stash -p` patch stash. Useful to stash some patche(s) or some file(s). *Personal comment from Andrey*: still prefer `stash/name` branches

`git merge <branch1> <branch2> <branch3>` Octopus merge

`rebase -x '<cmd>'` to insert `<cmd>` after every step of an interactive rebase. Various commands can also be inserted manually in-between.

## Remotes

`git push master:refs/private/andrey` It can be configured into which folder we push remotes. 
Then in git/config we can change what folders we check when fetching.
By default git clients check only refs/remotes and not ref/private, so ***WE CAN HIDE OUR REMOTE BRANCHES!!!***

## Tools

***Graphviz***

`code --new-window --wait` is a good call for vscode as git editor

`mkcd() { mkdir $1 && cd $1}`

`fuck` - shell script which applies proposed typo correction. *LOL*