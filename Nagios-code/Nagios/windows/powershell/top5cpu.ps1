$total=(Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples.CookedValue
$test = Get-Process -IncludeUserName | Sort-Object CPU -desc | Select -first 6 | Select ProcessName | Format-Table -AutoSize | out-file -filepath C:\top5cpu_data.txt
$test2 = Get-Content "C:\top5cpu_data.txt" | Select-Object -last 7
$test3 = $test2 -replace '\s',''
$name = $test3 | Select-Object -first 1

#$name = $test3 | Select-Object -first 1

#Write-Output("$test3")

if($total -ge 0 -and $total -le 60){
   Write-Output("OK - Usage of top5 cpu: '$test3 --> $name'  process OK State")
   exit 0
} elseif($total -ge 71 -and $total -le 80){
  C:\Python\Python38-32\python.exe C:\Users\top5cpu.py
   Write-Output("WARNING - Usage of top5 cpu: '$test3 --> $name'  process in WARNING State")
   exit 1
}
 elseif($total -ge 81 ){
 C:\Python\Python38-32\python.exe C:\Users\top5cpu.py
   Write-Output("CRITICAL - Usage of top5 cpu: '$test3 --> $name'  process in CRITICAL State")
   exit 2
}
 else{
   Write-Output("UNKNOWN - Usage of top5 cpu: '$test3 --> $name'  process in UNKNOWN State")
   exit 3
}
