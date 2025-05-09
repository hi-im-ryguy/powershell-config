# New-Alias cdmachinestatedatabase Set-Location .\Documents\Projects\Git\machine_state_database

function cdmachinestatedatabase { set-location "$HOME\Documents\Projects\Git\machine_state_database" }
function cdmsdbcsv { set-location "$HOME\Documents\Projects\Git\tae\msdb_csv" }
function sortcsv {
    [CmdletBinding()]
    Param ([switch]$d)
    if ($d) {
        python "$HOME\Documents\Projects\Git\machine_state_database\django\msdb\management\csv_updates\sort_csv.py" -d
    }
    else {
        python "$HOME\Documents\Projects\Git\machine_state_database\django\msdb\management\csv_updates\sort_csv.py"
    }
}

function mergecsv {
    python "$HOME\Documents\Projects\Git\machine_state_database\django\msdb\management\csv_updates\merge_csv.py"
}

function ccp {
    $current_working_directory = (pwd).Path
    Set-Clipboard $current_working_directory
    echo "Copied $current_working_directory to the clipboard!"
}

function get_last_FUSION {
    gci -filter "FUSION-*" | Sort-Object LastAccessTime | Select-Object -Last 10
}

function gittree {
    while($true) {
        git log --graph --pretty=oneline --abbrev-commit --all
        Start-Sleep -Seconds 2
        cls
    }
}

function git_stash_but_keep {
    git stash store $(git stash create) -m "Stash commit message"
}
