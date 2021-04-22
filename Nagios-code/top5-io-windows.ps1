Node script
************

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
   exit 1
}
 elseif($total -ge 71 ){

   Write-Output("CRITICAL - Usage of $total top5 io process --> $name2")
   exit 2
}
 else{
   Write-Output("UNKNOWN - Usage of $total top5 io process --> $name2")
   exit 3
}


Rundeck inline script
**********************

gwmi Win32_PerfFormattedData_PerfProc_Process | sort IOReadBytesPersec -des | select  IDProcess -First 6  | out-file -filepath C:\first_io_pid.txt

$pid1 = get-content C:\first_io_pid.txt | Select-Object -Index 3


$num=0

if ($pid1 -ge $num)
{
	
Write-Output  "first ---> $pid1"

################ service restart value1 #######################

$value=get-service | select-object Name | out-file -filepath C:\topcpu.txt

$count=(get-service | select-object Name).Length

$count1=$count+1

$val=2

while($val -le $count1)
     {
      $val++
      Write-Output  "$val"

          $value2=Get-Content "C:\topcpu.txt" | Select-Object -Index $val

          $space=$value2 -replace '\s',''

          #Write-Output "$value2"

          $value3=tasklist /svc /fi "SERVICES eq $space" | select-string $pid1

          if($value3)
          {
                  Write-Output "service#############$space#######restared"
                  Restart-Service  $space

          }
          else
          {
                  Write-Output "ONE NO VALUE"
          }

          #Write-Output "$value3"
     }




}

else

{
	
$pid2 = get-content C:\first_io_pid.txt | Select-Object -Index 4
Write-Output  "second --> $pid2"

################ service restart value2 #######################

$value=get-service | select-object Name | out-file -filepath C:\topcpu.txt

$count=(get-service | select-object Name).Length

$count1=$count+1

$val=2

while($val -le $count1)
     {
      $val++
      Write-Output  "$val"

          $value2=Get-Content "C:\topcpu.txt" | Select-Object -Index $val

          $space=$value2 -replace '\s',''

          #Write-Output "$value2"

          $value3=tasklist /svc /fi "SERVICES eq $space" | select-string $pid2

          if($value3)
          {
                  Write-Output "service#############$space#######restared"
                  Restart-Service  $space

          }
          else
          {
                  Write-Output "TWO NO VALUE"
          }

          #Write-Output "$value3"
     }	
	


}
