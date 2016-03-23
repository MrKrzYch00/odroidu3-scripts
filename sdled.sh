#!/bin/sh
# Changes blue to led to indicate SD card read/write activity.
echo mmc0 > /sys/class/leds/led1/trigger
