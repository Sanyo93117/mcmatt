#!/bin/bash
# McMatt

# Get Logged In User By Console

user=$(ls -la /dev/console | cut -d " " -f 4)

# Get A List Of Shares User Currently Has Mounted

current=$(mount | grep -i kors.local | sed 's/^Comment: *//;s/[ $].*$/$/' | sed 's/.*@//g' | sed 's/\$//g' | sed 's/^.*\///' )

echo $current

# Get A List Of AD Network Share Groups User Is A Member Of

groups=$(dscl /Active\ Directory/KORS/All\ Domains read /Users/$user dsAttrTypeNative:memberOf | tr " " '\n' | grep -E "\-W|\-R" | tr " " '\n' | cut -d "=" -f 2 | cut -f1 -d"," )

# Compare Shares User Has Mounted Against All Shares User Has Access To, Output Only Unmounted Shares

if [ "$current" = "" ]; then
	sharestomount=$groups
else
	sharestomount=$(echo "$groups" | grep -i -v "$current" )
	echo $sharestomount
fi

