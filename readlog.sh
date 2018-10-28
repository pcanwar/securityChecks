#!/bin/bash

# To read all requests greater than 400 and store them in array 

maxbadreq=0
while IFS=' ' read sitename a b dt c request filename  d http e
do

#echo $sitename $http $filename

if [ $http -ge 400 ] && [ $maxbadreq -lt $http ] # To check if http >=400 and not already been processed
then
maxbadreq=$http
#echo $http

grep $http access_log | awk '{print $7}' | sort #A list of files involved in the bad requests, sorted by file name, /var/log/httpd/access.log
grep $http access_log | awk '{print $1}' | sort # A list of computers involved in the bad requests
fi
done < access_log
