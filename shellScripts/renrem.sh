remote="origin"

if [ "$#" -eq 0 ] # if there are no arguments, just quit
then
    echo "Usage: $0 oldName newName or $0 newName" >&2
    exit 1
elif
    [ "$#" -eq 1 ] # if only one argument is given, rename current branch
then 
    oldBranchName="$(git branch | grep \* | cut -d ' ' -f2)" #save current branch name
    newBranchName=$1
else
    oldBranchName=$1
    newBranchName=$2
fi

git branch -m $oldBranchName $newBranchName

git push $remote :$oldBranchName #delete old branch on remote
git push --set-upstream $remote $newBranchName # add new branch name on remote and track it