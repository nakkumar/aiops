centos
*******


#!/bin/bash

countWarnings=$(top -b -n2 -p 1 | fgrep "Cpu(s)" | tail -1 | awk  '{ print $2 }')

top=$(ps -Ao comm --sort=-pcpu | head -n 6 | tail -5 | awk  'BEGIN { ORS="," } { print }')

pid=$(ps -Ao pid --sort=-pcpu | head -n 6 | awk -F: 'NR==2 {print $1}')

if (( ${countWarnings%%.*}<=30 )); then
                echo "OK - CPU Usage of top5 process : $top --> $pid"
                 curl -D - \
                -X "POST" -H "Accept: application/json" \
                -H "Content-Type: application/json" \
                -H "X-Rundeck-Auth-Token: WApjt25lt0SN8ONS0nRJXc7mqrZ8lQzC" \
                -d "{\"argString\":\"-pid $pid  \"}" \
#                http://192.168.5.116:4440/api/16/job/e5c5e06e-9fa7-4d5d-af12-280df85eaa6d/executions

                exit 0

        elif (( 31<=${countWarnings%%.*} && ${countWarnings%%.*}<=40 )); then
                echo "WARNING - CPU Usage top5 process : $top --> $pid "
                curl -D - \
                -X "POST" -H "Accept: application/json" \
                -H "Content-Type: application/json" \
                -H "X-Rundeck-Auth-Token: WApjt25lt0SN8ONS0nRJXc7mqrZ8lQzC" \
                -d "{\"argString\":\"-pid $pid  \"}" \
#                http://192.168.5.116:4440/api/16/job/e5c5e06e-9fa7-4d5d-af12-280df85eaa6d/executions
                exit 1

        elif (( 41<=${countWarnings%%.*} && ${countWarnings%%.*}<=100 )); then
                echo "CRITICAL - CPU Usage top5 process : $top --> $pid "
                exit 2
        else
                echo "UNKNOWN - $top --> $pid"
                exit 3
fi


*************************************************************************************************

#!/bin/bash

countWarnings=$(top -b -n2 -p 1 | fgrep "Cpu(s)" | tail -1 | awk  '{ print $2 }')

top=$(ps -Ao comm --sort=-pcpu | head -n 6 | tail -5 | awk  'BEGIN { ORS="," } { print }')

pid=$(ps -Ao pid --sort=-pcpu | head -n 6 | awk -F: 'NR==2 {print $1}')

if (( ${countWarnings%%.*}<=30 )); then
                echo "OK - CPU Usage of top5 process : $top --> $pid"
                exit 0

        elif (( 31<=${countWarnings%%.*} && ${countWarnings%%.*}<=40 )); then
                echo "WARNING - CPU Usage top5 process : $top --> $pid "
                exit 1

        elif (( 41<=${countWarnings%%.*} && ${countWarnings%%.*}<=100 )); then
                echo "CRITICAL - CPU Usage top5 process : $top --> $pid "
                exit 2
        else
                echo "UNKNOWN - $top --> $pid"
                exit 3
fi

################################################################################################################################################

#!/bin/bash

countWarnings=$(top -b -n2 -p 1 | fgrep "Cpu(s)" | tail -1 | awk  '{ print $2 }')

top=$(ps -Ao comm --sort=-pcpu | head -n 6 | tail -5 | awk  'BEGIN { ORS="," } { print }')

if (( ${countWarnings%%.*}<=30 )); then
                echo "OK - CPU Usage of top5 process : $top"
                exit 0

        elif (( 31<=${countWarnings%%.*} && ${countWarnings%%.*}<=40 )); then
                echo "WARNING - CPU Usage top5 process : $top "
                exit 1

        elif (( 41<=${countWarnings%%.*} && ${countWarnings%%.*}<=100 )); then
                echo "CRITICAL - CPU Usage top5 process : $top "
                exit 2
        else
                echo "UNKNOWN - $top"
                exit 3
fi


#########################################################################################################

ubuntu
******

#!/bin/bash

countWarnings=$(top -b -n2 -p 1 | fgrep "Cpu(s)" | tail -1 | awk  '{ print $2 }')

top=$(ps -Ao comm --sort=-pcpu | head -n 6 | tail -5 | awk  'BEGIN { ORS="," } { print }')

pid=$(ps -Ao pid --sort=-pcpu | head -n 6 | awk -F: 'NR==2 {print $1}')

if (( ${countWarnings%%.*}<=30 )); then
                echo "OK - CPU Usage of top5 process : $top --> $pid"
                 curl -D - \
                -X "POST" -H "Accept: application/json" \
                -H "Content-Type: application/json" \
                -H "X-Rundeck-Auth-Token: WApjt25lt0SN8ONS0nRJXc7mqrZ8lQzC" \
                -d "{\"argString\":\"-pid $pid  \"}" \
#                http://192.168.5.116:4440/api/16/job/ea1261e3-2981-43ed-a4b9-2e07b7e06bfe/executions

                exit 0

        elif (( 31<=${countWarnings%%.*} && ${countWarnings%%.*}<=40 )); then
                echo "WARNING - CPU Usage top5 process : $top --> $pid "
                curl -D - \
                -X "POST" -H "Accept: application/json" \
                -H "Content-Type: application/json" \
                -H "X-Rundeck-Auth-Token: WApjt25lt0SN8ONS0nRJXc7mqrZ8lQzC" \
                -d "{\"argString\":\"-pid $pid  \"}" \
#                http://192.168.5.116:4440/api/16/job/ea1261e3-2981-43ed-a4b9-2e07b7e06bfe/executions
                exit 1

        elif (( 41<=${countWarnings%%.*} && ${countWarnings%%.*}<=100 )); then
                echo "CRITICAL - CPU Usage top5 process : $top --> $pid "
                exit 2
        else
                echo "UNKNOWN - $top --> $pid"
                exit 3
fi


*******************************************************************

#!/bin/bash

countWarnings=$(top -b -n2 -p 1 | fgrep "Cpu(s)" | tail -1 | awk  '{ print $2 }')

top=$(ps -Ao comm --sort=-pcpu | head -n 6 | tail -5 | awk  'BEGIN { ORS="," } { print }')

if (( ${countWarnings%%.*}<=30 )); then
                echo "OK - CPU Usage of top5 process : $top"
                exit 0

        elif (( 31<=${countWarnings%%.*} && ${countWarnings%%.*}<=40 )); then
                echo "WARNING - CPU Usage top5 process : $top "
                exit 1

        elif (( 41<=${countWarnings%%.*} && ${countWarnings%%.*}<=100 )); then
                echo "CRITICAL - CPU Usage top5 process : $top "
                exit 2
        else
                echo "UNKNOWN - $top"
                exit 3
fi

#######################################################################################################

Windows
*******
$total=(Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples.CookedValue
$test = Get-Process -IncludeUserName | Sort-Object CPU -desc | Select -first 6 | Select ProcessName | Format-Table -AutoSize | out-file -filepath C:\top5cpu_data.txt
$test2 = Get-Content "C:\top5cpu_data.txt" | Select-Object -last 7
$test3 = $test2 -replace '\s',''
$name = $test3 | Select-Object -first 1

#$name = $test3 | Select-Object -first 1

#Write-Output("$test3")

if($total -ge 0 -and $total -le 60){
   Write-Output("OK - Usage of top5 cpu: '$test3 --> $name'  process OK State")
   exit 0
} elseif($total -ge 71 -and $total -le 80){
  C:\Python\Python37\python.exe C:\Users\cpu_utilization.py
   Write-Output("WARNING - Usage of top5 cpu: '$test3 --> $name'  process in WARNING State")
   exit 1
}
 elseif($total -ge 81 ){
   C:\Python\Python37\python.exe C:\Users\cpu_utilization.py
   Write-Output("CRITICAL - Usage of top5 cpu: '$test3 --> $name'  process in CRITICAL State")
   exit 2
}
 else{
   Write-Output("UNKNOWN - Usage of top5 cpu: '$test3 --> $name'  process in UNKNOWN State")
   exit 3
}
