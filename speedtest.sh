#! /bin/bash
# McMatt

sleep $(($RANDOM % 5400))

interface=$(networksetup -listallhardwareports | grep "Wi-Fi" -A 1 | grep Device | awk '{print $2}')
ip=$(ifconfig $interface | grep -v inet6 | grep inet | awk '{print $2}')
length=$(cat /usr/local/bin/speedtest-results | wc -l)

if [ -f /usr/local/bin/speedtest-results ]
then
	if [ "$length" -le 75 ]
	then	
		if [[ "$ip" == *"10.13"* ]]
		then	
			/usr/bin/python /usr/local/bin/speedtest_cli.py --source $ip | grep -E 'Download|Upload' >> /usr/local/bin/speedtest-results 
			date >> /usr/local/bin/speedtest-results 
			system_profiler SPNetworkDataType | grep Wi-Fi -A 10 | grep ARPResolvedHardwareAddress | awk '{print $2}' >> /usr/local/bin/speedtest-results
			echo "" >> /usr/local/bin/speedtest-results
		fi
	else
		mv /usr/local/bin/speedtest-results /usr/local/bin/speedtest-results-bck
		sed -e '1,25d' /usr/local/bin/speedtest-results-bck >> /usr/local/bin/speedtest-results
		rm /usr/local/bin/speedtest-results-bck
		/usr/bin/python /usr/local/bin/speedtest_cli.py --source $ip | grep -E 'Download|Upload' >> /usr/local/bin/speedtest-results 
		date >> /usr/local/bin/speedtest-results 
		system_profiler SPNetworkDataType | grep Wi-Fi -A 10 | grep ARPResolvedHardwareAddress | awk '{print $2}' >> /usr/local/bin/speedtest-results
		echo "" >> /usr/local/bin/speedtest-results
	fi
else
	if [[ "$ip" == *"10.13"* ]]
	then	
		/usr/bin/python /usr/local/bin/speedtest_cli.py --source $ip | grep -E 'Download|Upload' >> /usr/local/bin/speedtest-results 
		date >> /usr/local/bin/speedtest-results 
		system_profiler SPNetworkDataType | grep Wi-Fi -A 10 | grep ARPResolvedHardwareAddress | awk '{print $2}' >> /usr/local/bin/speedtest-results
		echo "" >> /usr/local/bin/speedtest-results
	fi
fi		
