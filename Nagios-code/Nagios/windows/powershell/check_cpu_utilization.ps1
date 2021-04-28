#$total=Get-WmiObject Win32_Processor | Measure-Object -Property LoadPercentage -Average | Select Average | ft -HideTableHeaders
$total=(Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples.CookedValue
if($total -ge 0 -and $total -le 60){
   Write-Output("OK - Usage of $total Bytes Services in OK State")
   exit 0
} elseif($total -ge 61 -and $total -le 70){
C:\Python\Python38-32\python.exe C:\Users\cpu.py
   Write-Output("WARNING - Usage of $total Bytes Services in WARNING State")
   exit 1
}
 elseif($total -ge 71 ){
C:\Python\Python38-32\python.exe C:\Users\cpu.py
   Write-Output("CRITICAL - Usage of $total Bytes Services in CRITICAL State")
   exit 2
}
 else{
   Write-Output("UNKNOWN - Usage of $total Bytes Services in UNKNOWN State")
   exit 3
}
