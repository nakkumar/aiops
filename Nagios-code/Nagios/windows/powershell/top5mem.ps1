###list top 5 memory process
$topmem = Get-Process -IncludeUserName | Sort-Object CPU -desc | Select -first 6 | Select ProcessName | out-file -filepath C:\top5mem_data.txt
$top5mem = Get-Content "C:\top5mem_data.txt" | Select-Object -last 7
$top5mem2 = $top5mem -replace '\s',''
Write-Output("$top5mem2")
#Get-Process -IncludeUserName | Sort-Object CPU -desc | Select -first 5

###list top 1 process PID
$pid1 = Get-Process -IncludeUserName | Sort-Object CPU -desc | Select -first 2  -Property id | Select -last 1 | out-file -filepath C:\top5mem_id1.txt
$pid2 = Get-Content "C:\top5mem_id1.txt" | Select-Object -last 3
Write-Output("id1 ---> $pid2")


###calculate the memory of the system
$totmem =  systeminfo  | Select-String -Pattern "Total Physical Memory"  
$totmem1 = $totmem -replace '\s','' | ForEach-Object {$_ -Replace "[^0-9]", ""}

$avamem =  systeminfo  | Select-String -Pattern "Available Physical Memory"
$avamem1 = $avamem -replace '\s','' | ForEach-Object {$_ -Replace "[^0-9]", ""}


$total = [int]((($totmem1-$avamem1)/$totmem1)*100)

if($total -ge 0 -and $total -le 60){
   Write-Output("OK - Usage of $total top5 memory --> top5mem2 ")
   exit 0
} elseif($total -ge 61 -and $total -le 80){
 C:\Python\Python38-32\python.exe C:\Users\top5mem.py
   Write-Output("WARNING - Usage of $total top5 memory --> top5mem2")
   exit 1
}
 elseif($total -ge 81 ){
 C:\Python\Python38-32\python.exe C:\Users\top5mem.py
   Write-Output("CRITICAL - Usage of $total top5 memory --> top5mem2")
   exit 2
}
 else{
   Write-Output("UNKNOWN - Usage of $total top5 memory --> top5mem2")
   exit 3
}
