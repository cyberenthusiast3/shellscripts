#!/bin/bash
process_name="xxxxx"
mem_threshold="YYYY"
ps_id=$(ps aux | grep $procss_name | grep -v grep | awk '{print $2}')
avail_mem=$(free -m | grep "Mem" | awk '{print $4}')

if [[ -z $ps_id && $avail_mem -gt $mem_threshold ]];then
	systemctl start xxxx.service
else
	echo "Service Running Fine"
fi
