#!/bin/bash
init() {
        gpio mode 0 out
        gpio mode 1 out
        gpio mode 3 out
        gpio mode 4 out
}

toggle() {
        state=$(gpio read $1);
        if [ $state -eq 1 ]; then
                gpio write $1 0
        elif [ $state -eq 0 ]; then
                gpio write $1 1
        fi
}

init

if [ "$1" == "blink" ]; then
        if [ -n "$2" ]; then
                delay="$2"
        else
                delay="0.5"
        fi
        if [ -n "$3" ]; then
                count="$3"
        else
                count="5"
        fi
        for i in `seq 1 $count`; do
                echo $i
                sleep $delay
                toggle 0
                toggle 1
                toggle 3
                toggle 4
                sleep $delay
        done
fi
