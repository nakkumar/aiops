
Get-Process -IncludeUserName | Sort-Object CPU -desc | Select -first 6 | Select id | Format-Table -AutoSize | out-file -filepath C:\cpu_pid.txt
$pid_test = Get-Content "C:\cpu_pid.txt"
$pid1 = $pid_test | select-object -index 3

$check=0

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
                  
				  $check=$check+1
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
	
$pid2 = $pid_test | select-object -index 4
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
                  $check=$check+1
          }
          else
          {
                  Write-Output "TWO NO VALUE"
          }

          #Write-Output "$value3"
     }	
	


}

if ($check -ge 1)

{
	Write-Output "SERVICE RESTARED"
}

else

{
	Write-Output "NO SERVICE RESTARED"

Get-Process -IncludeUserName | Sort-Object CPU -desc | Select -first 6 | Select name | Format-Table -AutoSize | out-file -filepath C:\cpu_name.txt
$name_test = Get-Content "C:\cpu_name.txt"
$filter1=$name_test | select-object -index 3 | where{$_ -ne ""}

Write-Output "$filter1"


$check=0


if ($filter1 -eq $total)

{
	Write-Output "EQUAL  $filter1-->$total"
	
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

          $value3=$space | select-string $filter2

          if($value3)
          {
                  Write-Output "service#############$space#######restared"
                  Restart-Service  $space
                  
				  $check=$check+1
          }
          else
          {
                  Write-Output "TWO NO #NAME# VALUES"
          }

          #Write-Output "$value3"
     }
		
}
else
{
	Write-Output "NOT EQUAL  #$filter1#$total#"
	
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

          $value3=$space| select-string $filter1

          if($value3)
          {
                  Write-Output "service#############$space#######restared"
                  Restart-Service  $space
                  
				  $check=$check+1
          }
          else
          {
                  Write-Output "ONE NO #NAME# VALUE"
          }

          #Write-Output "$value3"
     }
	
}
}
