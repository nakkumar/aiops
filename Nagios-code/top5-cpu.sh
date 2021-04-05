centos
*******

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

