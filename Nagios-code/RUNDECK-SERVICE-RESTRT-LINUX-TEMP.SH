#!/bin/bash

PID=$(ps -eo pid --sort=-%cpu | awk -F: 'NR=='3' {print $1}' | tr -d "[:space:]")
echo "***************************************************   $PID    ************************************"
if [ $PID -eq 1 ]; then
{
PID=$(ps -eo pid --sort=-%cpu | awk -F: 'NR=='2' {print $1}' | tr -d "[:space:]")

count=$(systemctl list-units --type=service | awk '{ print $1 }' | grep '.service' | wc -l)

echo "$count"

check=0

max=1

while [ $max -le $count ]

do
    echo $max

val=$(systemctl list-units --type=service | awk '{ print $1 }' | grep '.service' | awk -F: 'NR=='$max' {print $1}')

    echo "$val"

    max=$(($max+1))

test=$(systemctl status $val | grep $PID | awk '{ print $1 }' | awk -F: 'NR=='1' { print $1 }')

if [ ! -z $test ]; then

echo "ok"

systemctl restart $val

check=$(($check+1))

echo "service $val restarted"

else

echo "###########novalue#############"

fi

done
}
else
{

count=$(systemctl list-units --type=service | awk '{ print $1 }' | grep '.service' | wc -l)

echo "$count"

check=0

max=1

while [ $max -le $count ]

do
    echo $max

val=$(systemctl list-units --type=service | awk '{ print $1 }' | grep '.service' | awk -F: 'NR=='$max' {print $1}')

    echo "$val"

    max=$(($max+1))

test=$(systemctl status $val | grep $PID | awk '{ print $1 }' | awk -F: 'NR=='1' { print $1 }')

if [ ! -z $test ]; then

echo "ok"

systemctl restart $val

check=$(($check+1))

echo "service $val restarted"

else

echo "###########novalue#############"

fi

done
}
fi

if [ $check -ge 1 ];then
{
echo " SERVICE RESTARTED"
}
else
{
echo " SERVICE NOT RESTARTED"

name=$(ps -eo comm --sort=-%cpu | awk -F: 'NR=='3' {print $1}' | tr -d "[:space:]" | head -c 4)

count=$(systemctl list-units --type=service | awk '{ print $1 }' | grep '.service' | wc -l)

echo "$count"

max=1

while [ $max -le $count ]

do
    echo $max

val=$(systemctl list-units --type=service | awk '{ print $1 }' | grep '.service' | awk -F: 'NR=='$max' {print $1}')

    echo "$val"

    max=$(($max+1))

test=$(systemctl status $val | grep $name )

if [ ! -z $test ]; then

echo "ok"

systemctl restart $val

echo "MAPPING $val restarted"

else

echo "NAME MAPPING NOT MACHED"

fi

done


}
fi
