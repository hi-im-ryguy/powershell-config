# Copy Current Path
function ccp {
    $current_working_directory = (pwd).Path
    Set-Clipboard $current_working_directory
    echo "Copied $current_working_directory to the clipboard!"
}

function git_stash_but_keep {
    git stash store $(git stash create) -m "Stash commit message"
}

function delete_shada_file {
    rm ~/AppData/Local/nvim-data/shada
}

function restart_window_switcher {
    try {
        $id = (Get-Process window-switcher)[0].Id
        Stop-Process -Id $id
    } catch {
        "No window-switcher process found."
    }
    $path_to_window_switcher = "~\AppData\Local\Programs\window-switcher\window-switcher.exe"
    Start-Process $path_to_window_switcher
}
