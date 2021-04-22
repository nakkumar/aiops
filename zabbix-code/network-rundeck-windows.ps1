gwmi Win32_PerfFormattedData_PerfProc_Process | sort IODataBytesPersec -des | select  IDProcess -First 6  | out-file -filepath C:\first_net_pid.txt

$pid1 = get-content C:\first_net_pid.txt | Select-Object -Index 3


$num=0

if ($pid1 -ge $num)
{
	
Write-Output  "first ---> $pid1"

################ service restart value1 #######################

$value=get-service | select-object Name | out-file -filepath C:\net.txt

$count=(get-service | select-object Name).Length

$count1=$count+1

$val=2

while($val -le $count1)
     {
      $val++
      Write-Output  "$val"

          $value2=Get-Content "C:\net.txt" | Select-Object -Index $val

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
	
$pid2 = get-content C:\first_net_pid.txt | Select-Object -Index 4
Write-Output  "second --> $pid2"

################ service restart value2 #######################

$value=get-service | select-object Name | out-file -filepath C:\net.txt

$count=(get-service | select-object Name).Length

$count1=$count+1

$val=2

while($val -le $count1)
     {
      $val++
      Write-Output  "$val"

          $value2=Get-Content "C:\net.txt" | Select-Object -Index $val

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
