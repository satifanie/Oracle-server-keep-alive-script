#!/bin/bash
CPU_USAGE=15
while true
do
  CPUS=$(nproc)
  CPU_LIMIT=$(echo "$CPU_USAGE / $CPUS" | bc -l)
  for i in $(seq 1 "$CPUS"); do
    cpulimit -l "$CPU_LIMIT" -b dd if=/dev/zero of=/dev/null &
  done
  sleep 1800
  kill $(jobs -p)
done
