### print the top 5 io process ###

gwmi Win32_PerfFormattedData_PerfProc_Process | sort IOReadBytesPersec -des | select  Name -First 6 | out-file -filepath C:\top5io_name.txt

$name = Get-Content "C:\top5io_name.txt" | Select-Object -last 7 | where{$_ -ne ""}

$name2 = $name -replace '\s',''
#Write-Output("$name2")

### calculate the io usage of the system ###

$Counter = Get-Counter -Counter "\LogicalDisk(*)\Avg. Disk sec/Write"

$Counter.CounterSamples[4] |  select-object CookedValue | out-file -filepath C:\io_data.txt

$total = Get-Content "C:\io_data.txt" | Select-Object -Index 3 | where{$_ -ne ""}
#Write-Output "$total"

if($total -le 60){
   Write-Output("ok - Usage of $total top5 io process --> $name2")
   exit 0
} elseif($total -ge 61 -and $total -le 70){

   Write-Output("WARNING - Usage of $total top5 io process --> $name2")
    C:\Python\Python38-32\python.exe C:\Users\top5io.py
   exit 1
}
 elseif($total -ge 71 ){

   Write-Output("CRITICAL - Usage of $total top5 io process --> $name2")
    C:\Python\Python38-32\python.exe C:\Users\top5io.py
   exit 2
}
 else{
   Write-Output("UNKNOWN - Usage of $total top5 io process --> $name2")
   exit 3
}