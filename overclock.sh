#!/bin/bash
# Over/Underclocks Odroid U3 basing on first argument passed.
thisfile=`basename "$0"`
if [ "$#" -eq 1 ]
then
 if [[ $1 =~ ^[0-9]+$ ]]
 then
  echo $1000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
  echo $1000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
  echo $1000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
  echo $1000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq
  echo $1000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
  echo $1000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
  echo $1000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
  echo $1000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq
  echo Changed clock to $1Mhz
  exit 0
 fi
fi
echo "Usage: $thisfile <number as Mhz>"
