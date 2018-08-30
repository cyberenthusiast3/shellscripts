#!/usr/bin/env bash
today_date=$(date '+%Y%m%d')
output_file="/data/clamav_report/clamav_found_list.txt"
mail_list="xxxxxxxxx@yyyy.com"

if [ ! -f "$output_file" ]
then
  touch $output_file
else
  > $output_file
fi
###In our Server list one of our servers reports are zipped.
###thats why we are using zgrep in else part

for i in server1 server2 server3 server4
do
  if [ $i != "server4" ] 
  then
    filename=/data/clamav_report/${i}/clamavreport_${i}_${today_date}.txt
    echo "$today_date clamav findings on : $i Server" >> $output_file
    grep "FOUND" $filename >> $output_file
    echo -e "\n\n" >> $output_file
  else
    filename=/data/clamav_report/${i}/clamavreport_${i}_${today_date}.txt.gz
    echo "$today_date clamav findings on : $i Server" >> $output_file
    zgrep "FOUND" $filename >> $output_file
    echo -e "\n\n" >> $output_file
  fi
done

echo "Here the clamav Findings" | mailx -s "Clamav scan findings $today_date" -A "$output_file" $mail_list
