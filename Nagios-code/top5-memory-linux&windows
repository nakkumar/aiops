Linux
******
Node-script
***********

#!/bin/bash

countWarnings=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }' | sed 's/%//g')
name=$(ps -eo comm --sort=-%mem | head -n 6 | tail -5 | awk  'BEGIN { ORS="," } { print }')

if (( ${countWarnings%%.*}<=60 )); then
                echo "OK - Usage of   ${countWarnings%%.*} % top 5 process --> $name "
                exit 0
        elif (( 61<=${countWarnings%%.*} && ${countWarnings%%.*}<=70 )); then
                echo "WARNING - Usage of  ${countWarnings%%.*} % top 5 process --> $name"
                exit 1
        elif (( 71<=${countWarnings%%.*} && ${countWarnings%%.*}<=100 )); then
                echo "CRITICAL - Usage of  ${countWarnings%%.*} % top 5 process --> $name"
#                curl -D - \
#                -X "POST" -H "Accept: application/json" \
#                -H "Content-Type: application/json" \
#                -H "X-Rundeck-Auth-Token: BRaq7hklM9OxbHL5geLS8hG6AkJASbed" \
#                http://192.168.5.116:4440/api/16/job/6132d92c-423c-4e85-852a-df1edf5a96eb/executions
                exit 2
        else
                echo "UNKNOWN - ${countWarnings%%.*}"
                exit 3
fi


Rundeck-script
***************

#!/bin/bash

########variable($idd)#########idd=$(ps -eo pid --sort=-%mem | head -n 6 | awk -F: 'NR==2 {print $1}')

#systemctl list-units --type=service | awk '{ print $1 }' | grep '.service'  > /home/centos/top5/data.txt

count=$(systemctl list-units --type=service | awk '{ print $1 }' | grep '.service' | wc -l)

echo "$count"

max=1
while [ $max -le $count ]
do
    echo $max

val=$(systemctl list-units --type=service | awk '{ print $1 }' | grep '.service' | awk -F: 'NR=='$max' {print $1}')

    echo "$val"

    max=$(($max+1))

test=$(systemctl status $val | grep $idd | awk '{ print $1 }' | awk -F: 'NR=='1' { print $1 }')


if [ ! -z $test ]; then

echo "ok"

systemctl restart $val

echo "service $val restarted"


else

echo "###########novalue#############"

fi

#echo "$test"


#    sleep 0.5

done

################################################################################

Windows
********

Node-script
************

###list top 5 memory process
$topmem = Get-Process -IncludeUserName | Sort-Object CPU -desc | Select -first 6 | Select ProcessName | out-file -filepath C:\top5mem_data.txt
$top5mem = Get-Content "C:\top5mem_data.txt" | Select-Object -last 7
$top5mem2 = $top5mem -replace '\s',''
Write-Output("$top5mem2")
Get-Process -IncludeUserName | Sort-Object CPU -desc | Select -first 5

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
#  C:\Python\Python37\python.exe C:\Users\memoryusage.py
   Write-Output("WARNING - Usage of $total top5 memory --> top5mem2")
   exit 1
}
 elseif($total -ge 81 ){
#   C:\Python\Python37\python.exe C:\Users\memoryusage.py
   Write-Output("CRITICAL - Usage of $total top5 memory --> top5mem2")
   exit 2
}
 else{
   Write-Output("UNKNOWN - Usage of $total top5 memory --> top5mem2")
   exit 3
}

Rundeck-script
***************

###list top 5 memory process
$topmem = Get-Process -IncludeUserName | Sort-Object CPU -desc | Select -first 6 | Select ProcessName | out-file -filepath C:\top5mem_data.txt
$top5mem = Get-Content "C:\top5mem_data.txt" | Select-Object -last 7
$top5mem2 = $top5mem -replace '\s',''
Write-Output("$top5mem2")
Get-Process -IncludeUserName | Sort-Object CPU -desc | Select -first 5

###list top 1 process PID
$pid1 = Get-Process -IncludeUserName | Sort-Object CPU -desc | Select -first 2  -Property id | Select -last 1 | out-file -filepath C:\top5mem_id1.txt
$pid2 = Get-Content "C:\top5mem_id1.txt" | Select-Object -last 3 | where{$_ -ne ""}
Write-Output("id1 ---> $pid2")

#$test3 = $pid2 -replace '\s',''

#taskkill /PID $pid2 /F

################ service restart #######################

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
                  Write-Output "no valuse"
          }

          #Write-Output "$value3"
     }
