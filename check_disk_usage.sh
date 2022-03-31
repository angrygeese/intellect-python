#!/bin/bash
dir="$1"
if [ -d $dir ]; then
  echo -e "Checking disk usage in $dir\n"
else
  echo "$dir directory does not exist, exiting"
  exit 101
fi
echo -e "The heaviest subfolder of $dir is:"
top1=$(du -S $dir | sort -rn | head -n 1 | cut -f2)
disk=$(du -Sh -d 0 $top1 | sort -rn | head -n 1 | cut -f1)
echo "$top1 with disk usage of $disk"
echo "The heaviest subfolder of $dir is: $top1" | festival --tts
