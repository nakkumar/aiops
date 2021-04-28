$var= Get-Counter "\Network Interface(*)\Bytes Total/sec" | Format-Custom  | Out-File -FilePath C:\Users\networkinfo.txt
#Write-Output $var
$var=`Get-Content -Path C:\Users\networkinfo.txt -tail 13` | Out-File -FilePath C:\Users\networkinterface.txt 
#Write-Output $var
$values=`Get-Content -Path C:\Users\networkinterface.txt -head 1` 
$count=$values
#Write-Output $count
#$total_count = [math]::round($count)
$total_count=$count
#Write-Output $total_count
if($total_count -lt 1000000){
#   Write-Output("OK - Usage of $total_count Bytes Services in OK State")
    Write-Output("OK - Network Usage Services in OK State")
   exit 0
} elseif($total_count -ge 1000000){
   C:\Python\Python38-32\python.exe C:\Users\network.py
   Write-Output("CRITICAL - Usage of $total_count Bytes Services in CRITICAL State")
   exit 2
}