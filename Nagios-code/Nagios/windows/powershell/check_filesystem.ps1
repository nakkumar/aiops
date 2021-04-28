$disk = Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='C:'" | Select-Object Size, FreeSpace

$totdis = ("{0}" -f [math]::truncate($disk.Size / 1GB))
$avadis = ("{0}" -f [math]::truncate($disk.FreeSpace / 1GB))

#Write-Output("$totdis")
#Write-Output("$avadis")

#$usedisk = ($totdis-$avadis)

$total = [int]((($totdis-$avadis)/$totdis)*100)
#Write-Output("$total")

if($total -ge 0 -and $total -le 75){
   Write-Output("OK - Usage of $total Bytes Services in OK State")
   exit 0
} elseif($total -ge 76 -and $total -le 80){
C:\Python\Python38-32\python.exe C:\Users\filesystem.py
   Write-Output("WARNING - Usage of $total Bytes Services in WARNING State")
   exit 1
}
 elseif($total -ge 81 ){
C:\Python\Python38-32\python.exe C:\Users\filesystem.py
   Write-Output("CRITICAL - Usage of $total Bytes Services in CRITICAL State")
   exit 2
}
 else{
   Write-Output("UNKNOWN - Usage of $total Bytes Services in UNKNOWN State")
   exit 3
}