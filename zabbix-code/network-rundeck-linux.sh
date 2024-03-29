#!/bin/bash

#systemctl list-units --type=service | awk '{ print $1 }' | grep '.service'  > /home/centos/top5/data.txt

count=$(systemctl list-units --type=service | awk '{ print $1 }' | grep '.service' | wc -l)

#id=$(netstat -tunp | sort -r | awk '{ print $7}' |  awk -F: 'NR=='1' {print $1}' | sed 's/[^0-9]*//g')
echo "$count"

name=$(sudo netstat -tunp | sort -r | awk '{ print $7}' |  awk -F: 'NR=='1' {print $1}' | sed 's/[^a-z]*//g' | head -c 3)

max=1
while [ $max -le $count ]
do
    echo $max

val=$(systemctl list-units --type=service | awk '{ print $1 }' | grep '.service' | awk -F: 'NR=='$max' {print $1}'| grep $name)

    echo "$val"

    max=$(($max+1))


if [ ! -z $val ]; then

echo "ok"

systemctl restart $val

echo "service $val restarted"


else

echo "###########novalue#############"

fi

#echo "$test"


#    sleep 0.5

done

