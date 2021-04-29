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
	Write-Output  "WARNING- New log"
	Copy-Item -Path C:\log_before.txt -Destination C:\log_after.txt
         C:\Python\Python38-32\python.exe C:\Users\log.py
	exit 1
	 }

else
{
	Write-Output "OK- No New log"
        exit 0
	}