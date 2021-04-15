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
