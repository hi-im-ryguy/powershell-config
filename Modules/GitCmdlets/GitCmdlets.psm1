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

function gittree {
    while($true) {
        git log --graph --pretty=oneline --abbrev-commit --all
        Start-Sleep -Milliseconds 800
        cls
    }
}
