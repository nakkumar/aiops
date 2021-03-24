########### centos ##############################


#!/bin/bash
val=$(curl -s -w %{time_total}\\n -o /dev/null http://192.168.4.115/demo.php)
min=0.111
if (( ${val%%.*} < ${min%%.*} || ( ${val%%.*} == ${min%%.*} && ${val##*.} < ${min##*.} ) )) ; then
                echo "OK - Usage of   $val  services in okay  state"
                exit 0

else
                echo "CRITICAL - Usage of  $val  services in Critical state"
                curl -D - \
                -X "POST" -H "Accept: application/json" \
                -H "Content-Type: application/json" \
                -H "X-Rundeck-Auth-Token: NSUt9PpUTTJ6INH7xcjt09VyMcr8cexX" \
                -d "{\"argString\":\"-servicename $URL \"}" \
                http://192.168.5.116:4440/api/16/job/6fca6546-7d48-4c3f-be0d-977c594c2f0a/executions
                exit 2

fi

############# ubuntu  ####################################

#!/bin/bash
val=$(curl -s -w %{time_total}\\n -o /dev/null http://192.168.4.244/demo.php)
min=0.111
if (( ${val%%.*} < ${min%%.*} || ( ${val%%.*} == ${min%%.*} && ${val##*.} < ${min##*.} ) )) ; then
                echo "OK - Usage of   $val  services in okay  state"
                exit 0

else
                echo "CRITICAL - Usage of  $val services in Critical state"
                curl -D - \
                -X "POST" -H "Accept: application/json" \
                -H "Content-Type: application/json" \
                -H "X-Rundeck-Auth-Token: NSUt9PpUTTJ6INH7xcjt09VyMcr8cexX" \
                -d "{\"argString\":\"-servicename $URL \"}" \
                http://192.168.5.116:4440/api/16/job/0a9cd796-9d84-4771-b811-a1cdaaf37400/executions
                exit 2

fi


###############################################################################################################################




#!/bin/bash
val=$(curl -s -w %{time_total}\\n -o /dev/null http://192.168.4.115/demo.php)
min=0.111
if (( ${val%%.*} < ${min%%.*} || ( ${val%%.*} == ${min%%.*} && ${val##*.} < ${min##*.} ) )) ; then
#    min=$val

echo "ok"

else

echo "wwwwwww"
fi
