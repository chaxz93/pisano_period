#!/bin/bash

FibonacciNumbers()
{
  a=$1
  b=$2
  n=$3
  m=$4
    if [ "$n" -lt 0 ]
    then
        echo "Incorrect Input as n is too small"
    elif [ "$n" -eq 0 ]
    then
        echo "$a"
    elif [ "$n" -eq 1 ]
    then
        echo "$b"
    else
        arr[0]="$a"
        arr[1]="$b"
        previousMod="$(("$a"%"$m"))"
        currentMod="$(("$b"%"$m"))"
        n="$((n-1))"
        i="0"
        while [ $i -lt $n ]
        do
          tempMod="$previousMod"
          previousMod="$(("$currentMod"%"$m"))"
          currentMod="$((("$tempMod"+"$currentMod")%"$m"))"
          arr+=("$currentMod")
          if [ "$currentMod" -eq 1 ] && [ "$previousMod" -eq 0 ]
          then
            temp="$((i+1))"
            index="$((("$n"+1)%"$temp"))"
            echo arr["$index"]
          fi
          break
        i=$[$i+1]
        done
        echo "$currentMod"
    fi
}
FibonacciNumbers 2 3 5 8
