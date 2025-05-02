$versionMinimum = [Version]'7.1.999'

if (($host.Name -eq 'ConsoleHost') -and ($PSVersionTable.PSVersion -ge $versionMinimum))
{
	Set-PSReadLineOption -PredictionSource HistoryAndPlugin
}
else
{
	Set-PSReadLineOption -PredictionSource History
}

$ProfileDirectory = Split-Path -Path (gci $profile)
gci "$ProfileDirectory\my_custom_aliases.ps1" | foreach-object { . $_ }

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

Set-PSReadLineKeyHandler -Chord Tab     -Function Complete
Set-PSReadLineKeyHandler -Key UpArrow   -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

Set-PSReadLineOption -EditMode Windows

Set-PSReadLineKeyHandler -Key Alt+w `
-BriefDescription SaveInHistory `
-ScriptBlock {
	param($key, $arg)

	$line = $null
	$cursor = $null
	[Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
	[Microsoft.PowerShell.PSConsoleReadLine]::AddToHistory($line)
	[Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
}

Set-PSReadLineKeyHandler -Chord Ctrl+Shift+Delete -ScriptBlock {

	$in = ''

	[Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref] $in, [ref] $null)

	if ([string]::IsNullOrWhiteSpace($in)) {
		return
	}

	$historyPath = (Get-PSReadLineOption).HistorySavePath

	[Microsoft.PowerShell.PSConsoleReadLine]::ClearHistory()
	$content = [System.IO.File]::ReadAllLines($historyPath)
	Clear-Content $historyPath

	foreach ($line in $content) {
		if ($line.StartsWith($in, [System.StringComparison]::InvariantCultureIgnoreCase)) {
			continue
		}

		[Microsoft.PowerShell.PSConsoleReadLine]::AddToHistory($line)
	}
	[Microsoft.PowerShell.PSConsoleReadLine]::DeleteLine()
}

# zoxide Initialization
Invoke-Expression (& { (zoxide init powershell | Out-String) })
