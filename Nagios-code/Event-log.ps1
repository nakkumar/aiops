### we are monitoring the Application log for the below program
$line = Get-WinEvent -LogName Application -MaxEvents 1

$msg = $line.Message 

if ($line.LevelDisplayName -eq "Error")
{
Write-Output "WARNING '$msg' "
}
else
{
Write-Output "ok '$msg' "
}
