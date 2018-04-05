# Git-flow based tutorial

This is a small guide to help you getting started using git in a team environment.  
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
Whatever workflow (or their combination) a team is using, it should be fully defined.

The purpose of this document is to define such a flow.

## Foreword

Below is a proposal of how to use git in a project.   
It is based on best practices, originating from classical methods of working with git.  
We are not going to go into too many details, but we hope to provide enough information so that the process can be understood and followed.  
 
If you are interested, feel free to have a look at some more [useful references](#useful-references)!  
Also, do not hesitate to ask colleagues for help. They will be happy to help you with this topic! 
And if you learn something new, do not hesitate to share it with others or to update this document!

The first section of this document covers the main [Principles](#1-principles) of using git.  
Once you understand the principles, we will explain specific actions for specific situations in the [How-tos](#2-how-tos-in-normal-development) section.

## 1. Principles  

This section describes principles of using git.

### 1.1. Saving your progress

The process of saving your current changes is very similar in any workflow. You are most likely already familiar with it, but here is a small refresher:

1) You make changes.  
 After you made some changes and you think that you achieved some milestone which you want to save, procede to the next step. Don't be shy about saving your work in git often - doing it often for each logical step helps you to manage your progress and to easily "go back in time". It is quite okay to do up to several commits per hour.  
  
2) Select (also known as *add* or *stage*) the changes which you want to save now.  
Maybe you changed several things - for example you added a new model and also optimized some effects in an entirely different part of the project. If this is the case, select only one related part of your changes - for example only the model or only the effects.

3) *Commit* your changes. 
This saves your changes locally, so your curent progress is secure!  If you have more changes which logically are separate pieces of the project, repeat steps 2 and 3 again. This will make it easier for you and your team to see what was done, to conduct review and to merge changes with their own.  

4) *Push* your commit to the server. 
If you want to back up you changes online, you *push* them. You should do this to make your changes visible to your team, or to be able to continue working on another computer, or just to back up your progress because you don't trust your hard drive.

### 1.2. Branching

Using branches - various versions of history - is one of the most powerful features of git. Over the years, best practices of using branches were formed into so-called git workflows. These git workflows can be very efficient, if used correctly. Therefore it is very important that a team fully defines how branches are used and follows these rules, to get the most out of git.  
 
This part will describe a proposed way of using branches based on some of these best practices, especially the git flow principle (see [useful references](#useful-references)).

The following best practices are important:

1) *Feature-branch approach*  
It means that for every specific self-consistent feature which requires more than one commit (see [1.1. Saving your progress](#11-saving-your-progress), point 3), a separate branch should be created.  
This approach has many benefits:
* possible to share only desired changes, and not all changes which you have done. It allows doing several tasks at the same time.  
* easy to switch to another task if something is not working. Even one person can work on several tasks at the same time, and it is not a problem if one task can not be finished - just leave that feature-branch alone until the time is right (for example when you know how to finish it, or if someone else finished something which you needed, or simply when you have enough time to continue working on it)
* easy to find changes contributing to this feature later, in case we need to check how something was done
* easy to review
* this approach is scalable (regardless of how many people are in your team)

2) *Using development branch*  
Additionally to feature branches, a so-called development branch should be used. Whenever some feature is finished, it should be merged into the development branch. Whenever a new feature is started, it should be started at the top of development branch.

3) *4-eyes principle*  
It is a good idea if the feature branch is merged into development branch not by the feature branch author, but by someone else (reviewer). If there is a clear team leader, it can be done by him/her. If there is not, it can be done by a member who can understand/check this particular feature branch.

3) *Merge only into development*  
This principle defines that whenever a feature is completed, it is merged *only* into development branch and never into any other branches.

4) *Start from top of development branch, keep up-to-date*
Feature branches should be started from the top of development branch. Feature branches should also be rebased on top of it.  
This approach allows to have a very healthy easy-to-use history, rather when unhealthy history when people are merging branches randomly. Compare:  
-![healthy]-![unhealthy]  
Of course, you don't have to rebase your branch on development every time someone's feature is merged. You do it only in the following cases:
* you are finished with the feature branch. In this case you rebase it on top on development and request somebody to merge it
* you need that feature to continue with your feature
* you anticipate conflicts and want to solve them as early as possible
* you just want to be up-to-date with your colleagues work  

4) *Keep branches small*  
Usually it is a good idea to keep branches relatively small, because it is simple to merge/rebase/review them.
Almost any big feature can be separated into smaller features and thus smaller branches.

5) *Naming convention for branches*  
It is practical to name branches consistently. Git allows grouping branches by *group/branch* name notation.
The most common approach which we strongly recommend is using this:
* feature/nameOfFeature for features
* bugfix/nameOfBugfix for bugfixes during development
* hotfix/nameOfHotfixes for hot fixes on a release version
* release/v_xx_yy_zz for performing minor changes to get the release up and running

If the team works with any tool which has tasks (Trello, Jira, TFS etc.) it is also a good idea to add an ID of the task to the branch name. For example, if in Trello you have a card ID 131 (by default IDs in trello are hidden, but it is easy to show them), in which you say you want to make a splash screen, you create a new branch:
feature/131_SplashScreen

Doing so provides traceability, which allows to use git for finding code and even implementation history for specific features!



## 2. How-tos in normal development

This section describes what actions you should take in which situation, effectively fully defining the workflow.

Since different people might use different GUIs, this tutorial just names an action and provides a git command. If you cannot find appropriate action in your GUI of choice (SourceTree, GitKraken, Tower, GitExtensions etc.), don't hesistate to ask the team or Google!

In this section you will notice that using the feature-branch aproach makes branch operations very intuitive, because what you do with a feature - you also do with a branch!

### 2.1. Starting a feature

If you want to start a new feature, you  
1) pull development branch  
    `git checkout development`  
    `git pull`  
2) create a new branch at the tip of development branch  
    `git checkout -b feature/id_featureName`  
    Naturally id and featureName are your own, like 131_SplashScreen.

### 2.2. Working on a feature

You just keep adding and committing your changes, making your branch grow!  
We assume that you are familiar with these operations. If you are not, don't hesitate to ask your team mates or Google!

### 2.3. Getting updates from others

Fetch the changes from others to see who is doing what.   
`git fetch --all --prune`

`--prune` here deletes branches which do not exist anymore on the server.

**Important:**  do not merge changes of others directly, as stated in [1.2. Branching](#12-branching) !

Rather, if you feel that you need to get synchronized, rebase your branch on development branch:

`git checkout development`  
`git pull`  
`git checkout feature/id_featureName`
`git rebase development`

This way the content you get will be more stable compared to merging branches from others directly! In addition, the branch history will be clean and easy to use.

### 2.4. Switching between features

If you want to work on some other feature, just switch a branch. If it is a new feature, make a new branch just like explained above. Otherwise, just switch branches:  
`git checkout feature/anotherId_anotherFeatureName`

### 2.5. Finishing a feature

When you are done with a feature, rebase it on development and push it to the server. You can also push it more often as a back up or to work on a different computer.

`git rebase development`  
`git push`

### 2.6. Reviewing a feature

At this point you probably want your feature to get merged into development. It is a good idea to let someone else do that for you, because it implies a review.
There are different ways to let a reviewer know that you want your feature merged:
* create a pull request in your git website (BitBucket, GitHub, etc.)  
It is especially useful for big features, because in websites like BitBucket you can comment and discuss the feature changes. It will also help you and your team to find these discussions at a later point in time.
* via chat or any other communication tool
* by using a naming convention. For example, you add a prefix `merge/` to your branch like this:

`git branch -m whateverName merge/whateverName`

If you want a particular person to review your change, you can also specify that in the name, for example:

`git branch -m whateverName merge/reviewerName/whateverName`

*But in most cases, it is better if one pre-defined person is responsible for merging branches into development!*

### 2.7. Merging a feature

Once you are happy with the changes in the branch, peform a merge:

`git checkout development`  
`git merge feature/id_Name --no-ff`  

"--no -ff" here means no fast forward or *always create a merge commit*. So effectively you always get a commit which aggregates the whole feature. This way, when the branch is deleted, it allows you to still find it with the commit name and to check either aggregated changes, or commit by commit.

### 2.8. Deleting merged branch

After merging, the branch can be deleted.
It can be done with:

`git push -d branchName` to delete the branch on the server  
`git checkout development` to go back to development branch before deleting feature branch locally  
`git branch -d branchName` to delete feature branch locally

The reviewer has to delete both local (if he created it) and remote branches. For the author, it is enough to delete only local branch (remote one is deleted by reviewer). Others should only have remote branches, e.g. origin/branchName, so running `git fetch --all --prune` as described above will automatically delete all branches which are not on the server anymore.

## 3. How-tos in release process

### 3.1. Starting release

Whenever we feel like creating a release, we create a branch release/numberOfRelease. On this branch we do bugfixes and fine-tuning for the release.
This allows developers who are not involved in the release to keep working on their features.

### 3.2. Finishing release

Once we are happy with the status, we can merge this release branch into the master branch and create a tag with the version number. This is an official release version!

Also it is a good idea to merge back into development, so that all of our fine-tuning becomes accessible to everybody.

### 3.3. Starting hotfix

Whenever a hotfix is needed, i.e. we found a bug in a release and need to update but we don't want to test all new features, we create a hotfix branch from master branch and do our hotfix there.

### 3.4. Finishing hotfix

Once we are happy with the hotfix, we merge it back to master and... done!
Of course then we merge master branch into development as well to make our fix accessible to the whole team.

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