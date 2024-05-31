#! /bin/bash

#Save report as a datestamped file named raw_data_<YYYYMMDD>

today=$(date +%Y%m%d)
weather_report=raw_data_$today

#Download today’s weather report from wttr.in
city=Casablanca
curl wttr.in/$city --output $weather_report

#Extract the temperature data of interest
grep °C $weather_report > temperatures.txt

#Store this data in shell variable
obs_tmp=$(head -1 temperatures.txt | tr -s " " | xargs | rev | cut -d " " -f2 | rev)

#Extract tomorrow’s temperature forecast for noon, and store it in a shell variable
hour=$(TZ='Morocco/Casablanca' date -u +%H) 
day=$(TZ='Morocco/Casablanca' date -u +%d) 
month=$(TZ='Morocco/Casablanca' date +%m)
year=$(TZ='Morocco/Casablanca' date +%Y

#Append the resulting record as a row of data to weather log file
record=$(echo -e "$year\t$month\t$day\t$hour\t$obs_tmp\t$fc_temp")
echo $record>>rx_poc.log

#create cron job for script
#0 8 * * * /home/project/rx_poc.sh