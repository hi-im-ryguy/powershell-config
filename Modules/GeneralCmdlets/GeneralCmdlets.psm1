# Copy Current Path
function ccp {
    $current_working_directory = (pwd).Path
    Set-Clipboard $current_working_directory
    echo "Copied $current_working_directory to the clipboard!"
}

function gittree {
    while($true) {
        git log --graph --pretty=oneline --abbrev-commit --all
        Start-Sleep -Milliseconds 800
        cls
    }
}

function git_stash_but_keep {
    git stash store $(git stash create) -m "Stash commit message"
}

function delete_shada_file {
    rm ~/AppData/Local/nvim-data/shada/
}
