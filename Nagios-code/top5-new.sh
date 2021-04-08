#!/bin/bash

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

test=$(systemctl status $val | grep '31463')



echo "$test"


#    sleep 2

done

#########################################################################################################

#!/bin/bash

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

test=$(systemctl status $val | grep '24118'| awk '{ print $1 }' | awk -F: 'NR=='1' { print $1 }')


if [ ! -z $test ]; then

echo "ok"

systemctl restart $val

echo "service $val restarted"


else

echo "###########novalue#############"

fi

#echo "$test"


    sleep 0.5

done

###################################################################################################################################################

Windows
********
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
	  
	  $value3=tasklist /svc /fi "SERVICES eq $space" | select-string '7688'
	  
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
