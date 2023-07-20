#!/bin/sh

processes="${@}"

while [ true ]
do
  for process in "${processes[@]}"
  do
    [ -z `pgrep -i $process` ] && $process
  done
  sleep 1
done
