#!/bin/bash
# McMatt

# Enter the domain network shares are mounted under

domain=domain.com

# Get Logged In User By Console

user=$(ls -la /dev/console | cut -d " " -f 4)

# Get A List Of Shares User Currently Has Mounted

current=$(mount | grep -i $domain | sed 's/^Comment: *//;s/[ $].*$/$/' | sed 's/.*@//g' | sed 's/\$//g' | sed 's/^.*\///')

# Get A List Of AD Groups User Is A Member Of

groups=$(dscl /Active\ Directory/PRODAD/All\ Domains read /Users/$user dsAttrTypeNative:memberOf | cut -d' ' -f 2- | tr " " '\n'| awk -F",OU" '{ print $1 }' | sed -e 's/CN=//g;s/,$//;' | grep -i shr )

# Get Office Location

office=$(dscl /Active\ Directory/PRODAD/All\ Domains read /Users/$user dsAttrTypeNative:l)

if [ "$office" = "dsAttrTypeNative:l: Boston" ]; then
	location=bos
elif [ "$office" = "dsAttrTypeNative:l: New York" ]; then
	location=nyc
elif [ "$office" = "dsAttrTypeNative:l: Brentwood" ]; then
	location=brn
elif [ "$office" = "dsAttrTypeNative:l: Toronto" ]; then
	location=tor
fi

# Compared Shares User Has Mounted Against All Shares User Has Access To, Output Only Unmounted Shares

if [ "$current" = "" ]; then
	sharestomount=$groups
else
	sharestomount=$(echo "$groups" | grep -i -v "$current")
fi

if [ "$currentshares" != $user ]; then
	mkdir -p /Volumes/$user
	mount -t smbfs //$user:$1"@"$location'-files.hbgusa.com'/$user"$" /Volumes/$user
fi

# Mount Shares Based Off AD Group Membership

for i in $sharestomount; do
	groupmount=$(dscl /Active\ Directory/PRODAD/All\ Domains -read /Groups/$i Comment | tr -d '\n' | sed 's/^Comment: *//;s/[ $].*$/$/' | cut -b3- | sed 's/\\/\//g' )
	mountpoint=$(echo $i | cut -d'-' -f3-)
	mkdir -p /Volumes/$mountpoint
	mount -t smbfs //$user:$1"@"$groupmount /Volumes/$mountpoint
done

osascript -e 'tell app "System Events" to display dialog "Network Shares Mounted Successfully"'
