#!/bin/bash


sudo iotop -botqqq --iter=10 | awk '{ print $13 }' > /home/$(whoami)/iodata

name=$(cat /home/$(whoami)/iodata | head -n 5 | awk  'BEGIN { ORS="," } { print }')


free=$(iostat | awk -F: 'NR==4 {print $1}' | awk '{ print $6 }')
#echo "free io --> $free"
int=${free%.*}
#echo "$int"

total=100

used=$(( $total - $int ))

#echo "used io ---> $used"

if (( $used<=60 )); then
                echo "OK - I/O Usage of $used top5 IO --> $name"
                exit 0
        elif (( 61<=$used && $used<=70 )); then
                echo "WARNING - I/O Usage of $used top5 IO --> $name"
                exit 1
        elif (( 71<=$used )); then
                echo "CRITICAL - I/O Usage of $used top5 IO --> $name"
#                curl -D - \
#                -X "POST" -H "Accept: application/json" \
#                -H "Content-Type: application/json" \
#                -H "X-Rundeck-Auth-Token: NSUt9PpUTTJ6INH7xcjt09VyMcr8cexX" \
#                http://192.168.5.116:4440/api/16/job/0bd07a19-bea8-43f4-bf8d-9d748a04917d/executions
                exit 2
        else
                echo "UNKNOWN - $used top5 IO --> $name"
                exit 3
fi

###################################################################################################

#!/bin/bash





sudo iotop -botqqq --iter=10 | awk '{ print $13 }' > /home/$(whoami)/iodata

name=$(cat /home/$(whoami)/iodata | head -n 5 | awk  'BEGIN { ORS="," } { print }')

first=$(cat /home/$(whoami)/iodata | head -n 5 | awk -F: 'NR==1 {print $1,$2}'  | tr -d [,])
pid=$(ps -eo pid,comm,cmd | grep -w '$first' | awk '{ print $1 }')

echo "first process pid ---> ###############$pid"



free=$(iostat | awk -F: 'NR==4 {print $1}' | awk '{ print $6 }')
#echo "free io --> $free"
int=${free%.*}
#echo "$int"

total=100

used=$(( $total - $int ))

#echo "used io ---> $used"

if (( $used<=60 )); then
                echo "OK - I/O Usage of $used top5 IO --> $name"
                exit 0
        elif (( 61<=$used && $used<=70 )); then
                echo "WARNING - I/O Usage of $used top5 IO --> $name"
                exit 1
        elif (( 71<=$used )); then
                echo "CRITICAL - I/O Usage of $used top5 IO --> $name"
#                curl -D - \
#                -X "POST" -H "Accept: application/json" \
#                -H "Content-Type: application/json" \
#                -H "X-Rundeck-Auth-Token: NSUt9PpUTTJ6INH7xcjt09VyMcr8cexX" \
#                http://192.168.5.116:4440/api/16/job/0bd07a19-bea8-43f4-bf8d-9d748a04917d/executions
                exit 2
        else
                echo "UNKNOWN - $used top5 IO --> $name"
                exit 3
fi
