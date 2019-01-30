#!/bin/sh
MIN=30
SEC=$((MIN*60))
ps -eo etimes=,pid= | while read sec pid; do
 if [ ${sec} -gt ${SEC} ]; then
   echo ${pid}
 fi
done
