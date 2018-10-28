#!/bin/bash

#for i in `expr ps -ux user,pid,pcpu,pmem,pvsz,prss,ptty,pstat psdstart,ptime,pcommand,args | sort -r -k1 | less` ...
for i in `ps -e -o  pcpu,pid,user,args | sort -r| awk '{print $2}'`
do	

	pmem=`ps ux | grep "$i" | grep 'grep' -v | awk '{print $4}'` > /dev/null
	pcpu=`ps ux | grep "$i" | grep 'grep' -v | awk '{print $3}'` > /dev/null
	ptime=`ps ux | grep "$i" | grep 'grep' -v | awk '{print $10}'` > /dev/null
	pname=`ps ux | grep "$i" | grep 'grep' -v | awk '{print $11}'` > /dev/null
	puser=`ps ux | grep "$i" | grep 'grep' -v | awk '{print $1}'` > /dev/null
	ptimestarted1=`ps ux | grep "$i" | grep 'grep' -v | awk '{print $9}'` > /dev/null
	#echo $pcpu $pmem
	high_load1=0.75
	high_load2=0.75
	high_load2=0:60
	
	result1="$(echo $pcpu '>' $high_load1 | bc -l)" #check cpu usage > .75 #check its CPU usage that is greater than 75%
	result2="$(echo $pmem'>' $high_load2 | bc -l)" #check  memory usage >.25 #check  its memory usage that is greater than 25%
	result3="$(echo $ptime '>' $high_load3 | bc -l)" #check  execution time >1 hour #  its total execution time that has exceeded 1 hour.
	if [ $result1 -eq 1 && $result2 && $result3 -eq 1] > /dev/null; then
	# print pid  process_name user_name time_started CPU% total_running_time MEM%
		echo "$pid $pname $puser $ptimestarted $pcpu $ptime $pmem" 
	fi
done
