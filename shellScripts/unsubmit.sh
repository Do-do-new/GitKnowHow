mrgPrefix="merge/"
remote="origin"

oldBranchName="$(git branch | grep \* | cut -d ' ' -f2)" #save current branch name
newBranchName=${oldBranchName#$mrgPrefix}

git branch -m $newBranchName

git push $remote :$oldBranchName #delete old branch on remote
git push --set-upstream $remote $newBranchName # add new branch name on remote and track it
