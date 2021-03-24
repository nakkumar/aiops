#!/bin/bash
val=$(curl -s -w %{time_total}\\n -o /dev/null http://192.168.4.115/demo.php)
min=0.111
if (( ${val%%.*} < ${min%%.*} || ( ${val%%.*} == ${min%%.*} && ${val##*.} < ${min##*.} ) )) ; then
#    min=$val

echo "ok"

else

echo "wwwwwww"
fi
