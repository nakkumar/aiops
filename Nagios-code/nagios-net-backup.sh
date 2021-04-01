centos
*******

#!/bin/bash

var=$(iftop -Bt -L1 -s1 2> /dev/null | grep "Total send and receive rate:" | awk '{print$7}' > /tmp/networkinfo)
var=$(tail /tmp/networkinfo)

value=${var: -2}


if [[ "$value" == "MB" ]]; then
        total=${var:: -2}
        if (( ${total%%.*}<80 )); then
             echo "WARNING - Network Usage of $total MB Service in Warning State"
             exit 1
        elif (( 80<=${total%%,*} )); then
             echo "CRITICAL -Network Usage of $total MB Service in Critical State"
             curl -D - \
             -X "POST" -H "Accept: application/json" \
             -H "Content-Type: application/json" \
             -H "X-Rundeck-Auth-Token: NSUt9PpUTTJ6INH7xcjt09VyMcr8cexX" \
             http://192.168.5.116:4440/api/16/job/2c5e1fde-2497-474a-ab9c-b6a490f05a83/executions
             exit 2
            fi
else
        echo "OK - Network Usage $var Service in Okay State"
        exit 0
fi

ubuntu
******

#!/bin/bash

#var=$(iftop -Bt -L1 -s1 2> /dev/null | grep "Total send and receive rate:" | awk '{print$7}' > /tmp/networkinfo)
var=$(tail /tmp/networkinfo)

value=${var: -2}


if [[ "$value" == "MB" ]]; then
        total=${var:: -2}
        if (( ${total%%.*}<80 )); then
             echo "WARNING - Network Usage of $total MB Service in Warning State"
             exit 1
        elif (( 80<=${total%%,*} )); then
             echo "CRITICAL -Network Usage of $total MB Service in Critical State"
             curl -D - \
             -X "POST" -H "Accept: application/json" \
             -H "Content-Type: application/json" \
             -H "X-Rundeck-Auth-Token: NSUt9PpUTTJ6INH7xcjt09VyMcr8cexX" \
             http://192.168.5.116:4440/api/16/job/c8951445-e3a9-43eb-97bf-cd943bf73d22/executions
             exit 2
            fi
else
        echo "OK - Network Usage $var Service in Okay State"
        exit 0
fi
