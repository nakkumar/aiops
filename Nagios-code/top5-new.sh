#!/bin/bash
systemctl list-units --type=service | awk '{ print $1 }' | grep '.service'  > /home/centos/top5/data.txt

count=$(systemctl list-units --type=service | awk '{ print $1 }' | grep '.service' | wc -l)

echo "$count"

max=1
while [ $max -le $count ]
do
    echo $max

val=$(systemctl list-units --type=service | awk '{ print $1 }' | grep '.service' | awk -F: 'NR=='$max' {print $1}')

    echo "$val"

    max=$(($max+1))

    sleep 2

done
