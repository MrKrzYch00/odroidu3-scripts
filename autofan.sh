#!/bin/bash
# Shows CPU frequency, temperature and fan speed and sets fan speed basing
# on current temperature.
# 0% for 58*C and below
# 29% for 62*C-68*C
# 100% for 72*C and above
# sleeps for 5 seconds
echo manual > /sys/devices/platform/odroidu2-fan/fan_mode
fanspeed=255
while true
do
curtemp=$((`cat /sys/devices/virtual/thermal/thermal_zone0/temp` /1000))
curspeed=$((`cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq` /1000))
if [ $curtemp -le 58 ]
then
    fanspeed=0
elif [ $curtemp -ge 62 -a $curtemp -le 68 ]
then
    fanspeed=75
elif [ $curtemp -ge 72 ]
then
    fanspeed=255
fi
echo $fanspeed > /sys/devices/platform/odroidu2-fan/pwm_duty
fanspeed2=$(printf "%.0f" $(bc -lq <<< "($fanspeed / 255) * 100"))
echo -ne "$HOSTNAME CPU: ${curspeed}Mhz TEMP: ${curtemp}*C FAN: ${fanspeed2}%   \r"
sleep 5
done
