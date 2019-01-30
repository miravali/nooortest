#!/bin/bash

for i in $(pgrep -f bull)
do
    TIME=$(ps --no-headers -o etimes $i)
    if [ "$TIME" -ge 1800 ] ; then
        kill $i
    fi
done
