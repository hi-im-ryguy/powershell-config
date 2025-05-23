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

function gittree {
    while($true) {
        git log --graph --pretty=oneline --abbrev-commit --all
        Start-Sleep -Milliseconds 800
        cls
    }
}
