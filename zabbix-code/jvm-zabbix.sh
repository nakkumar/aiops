#!/bin/bash

test=$(sudo jps | grep ForExample | awk -F: 'NR==1 {print $1}' |  awk '{ print $1 }')
if [ -z $test ]; then
{

  echo "0"
}

elif [ ! -z $test ];then
{
  sudo jmap -histo:live $test | grep 'Total' | awk '{ print $3}'
}


fi
