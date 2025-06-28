function gco {
    Param([string]$branch_name)
    git checkout $branch_name
}

function gb {
    Param([string]$branch_name)
    git branch $branch_name
}

function gfb {
    Param([string]$branch_name)
    git branch -f $branch_name
}

function gcp {
    Param([string]$sha_id)
    git cherry-pick $sha_id
}

function gp {
    git push
}

function gfp {
    git push --force
}

function gittree {
    while($true) {
        git log --graph --pretty=oneline --abbrev-commit --all
        Start-Sleep -Milliseconds 800
        cls
    }
}

function git_commit_history_of_file {
    Param([string]$filepath)
    git log --follow --patch -- $filepath
}

function git_changes_since_base {
    Param([string] $base)
    if ($base -eq "") {
        Write_Host "Please provide the Git node."
        return
    }

    git diff $(git merge-base --fork-point $base)
}

function git_changes_since_last_commit_for_this_file {
    Param([string] $filepath)
    git diff HEAD~1 $filepath
}

function git_delete_stash_by_id {
    Param([int]$id)
    if ($id -eq "") {
        Write-Host "Please provide a stash id."
        return
    }
    git stash drop "stash@{$id}"
}
