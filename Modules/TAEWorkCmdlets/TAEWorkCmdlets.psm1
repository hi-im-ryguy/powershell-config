function cdmachinestatedatabase { set-location "$HOME\Documents\Projects\Git\machine_state_database" }

function cdmsdbcsv { set-location "$HOME\Documents\Projects\Git\tae\msdb_csv" }

function pg_dump_msdb {
    pg_dump --file=pgdump.sql --format=custom -U postgres -d msdb -h 127.0.0.1 -avxOW -w --exclude-table=public.auth_permission  --exclude-table=django_content_type --exclude-table=django_migrations
}

# Easily naviate JIRA folder to enter FUSION tickets.
# Provide a number as an argument and cdjira will try to enter a folder named FUSION-{argument}
#
# Usage
# PS > cdjira 5050
function cdjira {
    [CmdletBinding()]
    Param ([string]$arg1 = "")

    $jiraBasePath = Join-Path -Path $env:USERPROFILE -ChildPath "Documents\JIRA"

    # FEATURE
    # When providing a $arg1 that doesn't exist yet (a folder for your arg doesn't exist)
    if ($arg1 -eq "") {
# create the folder for the user.
        Set-Location -Path $jiraBasePath
    } else {
        $fusionPath = Join-Path -Path $jiraBasePath -ChildPath "FUSION-$arg1"
        Set-Location -Path $fusionPath
    }
}

function sortcsv {
    [CmdletBinding()]
    Param ([switch]$d, [string]$filepath)
    Write-Host "ayy"
    $sort_csv_file_path = "$HOME\Documents\Projects\Git\machine_state_database\django\msdb\management\csv_updates\sort_csv.py"
    $options = @()
    if ($d) {
        $options += "-d"
    }
    if ($filepath) {
        $options += "--input_file $filepath"
    }
    $options = ($options -split " ")
    $expression = "python $sort_csv_file_path $options"
    echo "Final expression: $expression"
    Invoke-Expression $expression
}

function mergecsv {
    python "$HOME\Documents\Projects\Git\machine_state_database\django\msdb\management\csv_updates\merge_csv.py"
}

function get_last_FUSION {
    gci -filter "FUSION-*" | Sort-Object LastAccessTime | Select-Object -Last 10
}

