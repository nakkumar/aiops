$totmem =  systeminfo  | Select-String -Pattern "Total Physical Memory"  
$totmem1 = $totmem -replace '\s','' | ForEach-Object {$_ -Replace "[^0-9]", ""}
#$totmem2 = $totmem1 | ForEach-Object {$_ -Replace "[^0-9]", ""}
#Write-Output("$totmem1")

$avamem =  systeminfo  | Select-String -Pattern "Available Physical Memory"
$avamem1 = $avamem -replace '\s','' | ForEach-Object {$_ -Replace "[^0-9]", ""}
#$avamem2 = $avamem1 | ForEach-Object {$_ -Replace "[^0-9]", ""}
#Write-Output("$avamem1")

$total = [int]((($totmem1-$avamem1)/$totmem1)*100)

if($total -ge 0 -and $total -le 60){
   Write-Output("OK - Usage of $total Bytes Services in OK State")
   exit 0
} elseif($total -ge 61 -and $total -le 80){
   Write-Output("WARNING - Usage of $total Bytes Services in WARNING State")
   exit 1
}
 elseif($total -ge 81 ){
#C:\Python\Python38-32\python.exe C:\Users\memoryusage.py
   Write-Output("CRITICAL - Usage of $total Bytes Services in CRITICAL State")
   exit 2
}
 else{
   Write-Output("UNKNOWN - Usage of $total Bytes Services in UNKNOWN State")
   exit 3
}
