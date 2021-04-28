$var= Get-Counter "\Process(_total)\IO Data Operations/sec" | Format-Custom  | Out-File -FilePath C:\Users\cpu_load.txt
$var=`Get-Content -Path C:\Users\cpu_load.txt -tail 7` | Out-File -FilePath C:\Users\cpu_ioload.txt 
$values=`Get-Content -Path C:\Users\cpu_ioload.txt -head 1`
#Write-Output $values
$total = [math]::round($values)
#Write-Output $total
if($total -lt 1000000){
   Write-Output("OK - Usage of $total Bytes Services in OK State")
   exit 0
} elseif($total -ge 1000000){
   C:\Python\Python38-32\python.exe C:\Users\io.py
   Write-Output("CRITICAL - Usage of $total Bytes Services in CRITICAL State")
   exit 2
}