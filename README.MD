# Git-flow based tutorial

This is a small guide with some of the git best practices to take most out of git.  
It is targeted at people having small to medium experience with git.


<!-- TOC -->

- [Git-flow based tutorial](#git-flow-based-tutorial)
    - [Purpose of this document](#purpose-of-this-document)
    - [Foreword](#foreword)
    - [1. Principles](#1-principles)
        - [1.1. Saving your progress](#11-saving-your-progress)
        - [1.2. Branching](#12-branching)
    - [2. How-tos in normal development](#2-how-tos-in-normal-development)
        - [2.1. Starting a feature](#21-starting-a-feature)
        - [2.2. Working on a feature](#22-working-on-a-feature)
        - [2.3. Getting updates from others](#23-getting-updates-from-others)
        - [2.4. Switching between features](#24-switching-between-features)
        - [2.5. Finishing a feature](#25-finishing-a-feature)
        - [2.6. Reviewing a feature](#26-reviewing-a-feature)
        - [2.7. Merging a feature](#27-merging-a-feature)
        - [2.8. Deleting merged branch](#28-deleting-merged-branch)
    - [3. How-tos in release process](#3-how-tos-in-release-process)
        - [3.1. Starting release](#31-starting-release)
        - [3.2. Finishing release](#32-finishing-release)
        - [3.3. Starting hotfix](#33-starting-hotfix)
        - [3.4. Finishing hotfix](#34-finishing-hotfix)
    - [Useful references](#useful-references)

<!-- /TOC -->

## Purpose of this document

Git is a very flexible tool which allows a lot of operations.  
That is why during the years several possible workflows appeared.  
Whatever workflow (or their combination) team is using, it should be fully defined.

Ther purpose of this document is to define such a flow.

## Foreword

Below is a proposal how to use git in our projects.   
It is based on best practices, originating from classical methods of working with git.  
We are not going to go into too many details, but hope to provide enough info so that the process can be followed.  

Also we will not cover creating new projects and some other topics.  
Still if you are interested in more, feel free to have a peek at  some [useful references](#useful-references) !  
Also do not hesitate to ask colleagues, they will be happy to help you with this topic! Also if you learned something new, do not hesitate to share it with others!

## 1. Principles  

This section describes principles of using git.  
Next section, [How-tos](#2-how-tos-in-normal-development), lists exact actions to be done for exact situations.

### 1.1. Saving your progress

Process of saving your current changes is pretty much the same in any workflow and, most likely, already familiar to you.  

1) You make changes.  
 Once you think that you achieved some small milestone which you want to save, procede to the next step.   
 Don't be shy about saving your work in git often - doing it often for each logical step you do helps manage your changes and "go back in time" easier.   
It is quite okay to do up to several commits per hour.  
  
2) Select (also known as *add* or *stage*) the changes which you want to save now.  
May be you changed several things - for example added a new model and also optimized some effects in an entirely different part of the project).  
If it is the case, select now only a new model.

3) *Commit* your changes. It saves them locally, so your curent effort is now secure!  
If you have more changes which logically is a separate piece of work, repeat steps 2 and 3 again.  
This will make it easier for you and your teammates to see what was done, to conduct review, to merge changes with their own etc.  

4) If you want to back up you changes also on the server, you *push* them.   
It can be done to make your changes visible to teammates, to continue working on another computer or just to back up your progress because you don't trust your hard drive.

### 1.2. Branching

Using branches - various versions of history - is one of the most powerful features of git.  
The way branches are used defines git workflow.  
It is very important to fully define how the branches are used and to follow these rules, to take the most out of git.  
Over the years best practices of using branches were formed, which proved to be very efficient.  
This part will describe proposed way of using branches based on some of these best practices.
Principles described here are mostly based on git flow (see [useful references](#useful-references)).

The following best practices are important:

1) *Feature-branch approach*  
It means that for every specific self-consistent feature which requires more than one commit (see [1.1. Saving your progress](#11-saving-your-progress), point 3), separate branch should be created.  
This approach has many benefits:
* possible to share only desired changes, and not all changes which you have done. It allows doing several tasks at the same time.  
* easy to switch to another task if something is not working. Even one person in this case can work on several tasks at the same time, and it is not a problem if one task can not be finished - just leave that feature-branch alone until the time is right (you know how to finish it, someone else finished something which you need or simply you have enough time for this one)
* easy to find changes contributing to this feature later if we need to check how something was done
* easy to review
* this approach is scalable (regardless of how many people there are)

2) *Using Development branch*  
Additionally to feature branches, so-called development branch should be used. Whenever some feature is finished, it should be merged into development branch. Whenever new feature is started, it should be started at the top of development branch.

3) *4-eyes principle*  
It is a good idea if the feature branch is merged into development branch not by the feature branch author, but by someone else (reviewer). If there is a clear team leader, it can be done by him/her. If there is not, it can be done by a member who can understand/check this particular feature branch.

3) *Merge only into Development*  
This principle means that whenver feature is done, it is merged into Development branch *only*.

4) *Start from top on Development, keep up-to-date*
Feature branches should be started from the top of development branch.  
Feature branches should also be rebased on top of it.  
This approach allows to have a very healthy easy-to-use history, rather when unhealthy history when people are merging branches randomly. Compare:  
-![healthy]-![unhealthy]  
Of course you don't have to rebase your branch on Development once someone's feature is merged. You do it in the following cases:
* you are finished with the branch. In this case you rebase it on top on development and request somebody to merge it
* you need that feature to continue with your feature
* you anticipate conflicts and want to solve them as early as possible
* you just want to be up-to-date with your colleagues work  

4) *Keep branches small*  
Usually it is a good idea to keep branches relatively small, because it is simple to merge/rebase/review them.  
Almost any big feature can be separated into smaller features and thus smaller bracnhes.

5) *Naming convention for branches*  
It is practical to name branches consistently. 
Git allows grouping branches by *group/branch* name notation.
Most common approach which we strongly recommend using is:
* feature/nameOfFeature for features
* bugfix/nameOfBugfix for bugfixes during development
* hotfix/nameOfHotfixes for hot fixes on a release version

* release/v_xx_yy_zz for performing minor changes to get the release up and running

If the team works with any tool which has tasks (Trello, Jira, TFS etc.) it is also a good idea to add ID of the task when naming a branch.  
E.g. if in Trello you have a card ID 131 (by defaults IDs in trello are hidden, but it is easy to show them), in which you say you want to make a splash screen, you create a new branch:
feature/131_SplashScreen


Doing so provides traceability, which allows to use git for finding code and even implementation history for specific features!



## 2. How-tos in normal development

This section describes what actions you should take in which situation, effectively fully defining the workflow.

Since different people might use different guis, this tutorial just names an action and provides a git command. If you can not find appopriate action in your UI of choice (SourceTree, GitKraken, Tower, GitExtensions etc.), don't hesistate to ask the team or google!

In this section you will notice that using feature-branch aproach makes operations with branches very intuitive, because what you do with a feature - same you do with a branch!

### 2.1. Starting a feature

If you want to start a new feature, you  
1) pull Development branch  
    `git checkout Development`  
    `git pull`  
2) create a new branch at the tip of development branch  
    `git checkout -b feature/id_featureName`  
    Naturally id and featureName are your own, lik1 131_SplashScreen.

### 2.2. Working on a feature

You just keep adding and committing your changes, making your branch grow!  
Here we assume that you are quite familiar with these operations, if not, do not hesitate to ask your team mates or google!

### 2.3. Getting updates from others

Fetch the changes from others to see who is doing what.   
`git fetch --all --prune`

`--prune` here deletes branches which do not exist anymore on the server.

**Important:**  do not merge changes of others directly, as stated in [1.2. Branching](#12-branching) !

Rather, if you fill that you need to get in sync, rebase your branch on Development branch:

`git checkout Development`  
`git pull`  
`git checkout feature/id_featureName`
`git rebase development`

This way the content you get will be more stable, compared to merging branches from others directly! Also history will be clean and useful.

### 2.4. Switching between features

If you want to work on some other feature, just switch a branch. If it is a new feature, make also a new branch, as described above. Otherwise, just switch branches:  
`git checkout feature/anotherId_anotherFeatureName`

### 2.5. Finishing a feature

When you are done with the feature, rebase it on Development and push it to the server. You can also push it more often as a back up measure or to work on different computers.

`git rebase Development`  
`git push`

Now you want your feature to get merged into Development.  
It is a good idea to let someone else do that for you, because it implies a review.
There are different ways to let a reviewer know that you want your feature merged:
* create a pull request in bitbucket (or whatever site is used).   
It is especially useful for big features, because in bitbucket you can comment on the changes, discuss things related to this particular feature - and it will be easy to find this discussion later - and more.
* just let a reviewer know that you want your branch merged per chat or whatever other communication means
* by using a naming convention. For example, you add a prefix `merge/` before your branch. Just rename it:

`git branch -m whateverName merge/whateverName`

If you want a particular person to review your change, you can specify that as well in the name, for example:

`git branch -m whateverName merge/reviewerName/whateverName`

*But, in most cases, it is better if one person is responsible for merging branches into Development!*

### 2.6. Reviewing a feature

Now if someone wants to review their changes, feel honored to do so! :-)
Have a look if there changes compile, if the project runs okay and if you like there changes in general.

If you are not happy with the result, ask that person to add corrections to their feature branch!


### 2.7. Merging a feature

Once you are happy with the changes in the branch, peform a merge:

`git checkout Development`  
`git merge feature/id_Name --no-ff`  
`--no -ff` here means no fast forward or *always create a merge commit*. So effectctively you always get a commit which aggregates the whole feature. This way, when the branch is deleted, you can still find it by the commit name. And also check either aggregated changes, or commit by commit.

### 2.8. Deleting merged branch

After merging, the branch can be deleted.
It can be done with  
`git push -d branchName` to delete branch on the server  
`git checkout Development` to go back to development before deleting branch locally  
`git branch -d branchName` to delete branch locally

Reviewer has to delete both local (if he created it) and remote branches.  
For author then it is enough to delete only local branch (remote one is deleted by reviewer)
Others should have only remote branches, e.g. origin/branchName, so running `git fetch --all --prune` as described above will automatically delete all branches which are not any more on the server.

## 3. How-tos in release process

### 3.1. Starting release

Whenever we feel like creating a release, we create a branch release/numberOfRelease. Their we do bugfixes and fine-tuning for the release.
This way developers not involved in release can keep working on their features.

### 3.2. Finishing release

Once the state is nice, we can merge this release branch into master branch and create a tag there with the version number.
Here is our release!

Also it is a good idea to merge back into Development, so that all of our fine-tuning becomes accessible to everybody.

### 3.3. Starting hotfix

Whenever hotfix is needed, i.e. we found a bug in a release and want a new one, but we don't want to test all new features. Let's say we want a new release which is like old one + fix.

We create a hotfix from master branch, do out hotfix there.

### 3.4. Finishing hotfix

Once we are fine with the hotfix, we merge it back to master and... done!

Of course then we merge master branch into Development as well to make our fix accessible.

## Useful references

Original article on git flow  
http://nvie.com/posts/a-successful-git-branching-model/

Git cheat-sheets  
https://www.git-tower.com/blog/git-cheat-sheet/  
https://www.atlassian.com/git/tutorials/atlassian-git-cheatsheet  
https://ndpsoftware.com/git-cheatsheet.html

Atlassian description of the workflows:  
https://www.atlassian.com/git/tutorials/comparing-workflows/feature-branch-workflow  
https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow

Git main site  
https://git-scm.com/

Git reference  
https://git-scm.com/docs

Git Pro book, most comprehensive manual on git  
https://git-scm.com/book/en/v2

Git glossary  
https://mirrors.edge.kernel.org/pub/software/scm/git/docs/gitglossary.html

List of git guis  
https://git-scm.com/downloads/guis

Couple of presentations from me on Git:  
https://github.com/Nochdarus/GitKnowHow

Nice web-based presentation on Git:  
https://github.com/agross/git-reveal

[healthy]: ./Docs/images/HealthyGitGraph.jpg
"Healthy git graph"
[unhealthy]: ./Docs/images/UnhealthyGitGraph.jpg
"Unhealthy git graph"