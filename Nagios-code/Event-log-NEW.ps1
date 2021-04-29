jenkins
*******

restart-service sppsvc


windows-code
************
#New-Item -Path "c:\" -Name "log_before.txt" -ItemType "file" -Value "This is a text string."
#New-Item -Path "c:\" -Name "log_after.txt" -ItemType "file" -Value "This is a text string."

$line = Get-EventLog -LogName "Application" -Newest 1

$msg = $line.Message 
$msg | out-file -filepath C:\log_before.txt
#get-content C:\log_before.txt

$fileA = "C:\log_before.txt"
$fileB = "C:\log_after.txt"

if(Compare-Object -ReferenceObject $(Get-Content $fileA) -DifferenceObject $(Get-Content $fileB))

 {
	Write-Output  "files are different"
	Copy-Item -Path C:\log_before.txt -Destination C:\log_after.txt
	 }

else
{
	Write-Output "Files are the same"
	}
