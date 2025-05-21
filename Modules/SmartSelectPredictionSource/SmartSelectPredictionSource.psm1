if (($host.Name -eq 'ConsoleHost') -and ($PSVersionTable.PSVersion -ge $versionMinimum))
{
	Set-PSReadLineOption -PredictionSource HistoryAndPlugin
}
else
{
	Set-PSReadLineOption -PredictionSource History
}
