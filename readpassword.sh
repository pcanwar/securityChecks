#!/bin/bash

file="./user-list-`date +%Y%m%d`.csv"
shellfile=/etc/shells
while IFS=: read user password uid gid info home shell
do
    
	if [ $uid -gt 500 ]; then
		echo \"$user\" \"$uid\" \"$gid\" \"$info\" \"$home\" \"$shell\" #>> $filey 
		#check for valid shell by comparing with /etc/shels
		for i in $(cat $shellfile)   
		do 
			#echo $i
			if [ "${shell}" = "${i}" ];then
				echo "Valid shell $shell"
			fi
		done
		#check if the home directory has 700 permission
		#if [ `stat -c "%a" $home` -eq 700 ] >> /dev/null ; then
		#	echo "home directory has 700 permission"
		#fi

		
	fi
	#check duplicate user name
	usercount=0
	uidcount=0
	while IFS=: read user1 password1 uid1 gid1 info1 home1 shell1
	do
		#echo "xxxx"$user$user1
		if [ "${user}" = "${user1}" ];then
		usercount=`expr $usercount + 1`

		
		fi
		if [ "${uid}" = "${uid1}" ];then
		uidcount=`expr $uidcount + 1`

		
		fi
	done < passwd
	if [ $usercount -ge 2 ];then
		echo "Duplicate user"
	fi
	if [ $uidcount -ge 2 ];then
		echo "Duplicate UID"
	fi
done < passwd #/etc/passwd
#global check on group file
while IFS=: read group_name password gidg userlist
do
	groupnamecount=0
	gidcount=0
	while IFS=: read group_name1 password1 gidg1 userlist1
	do
		if [ "${group_name}" = "${group_name1}" ];then
		groupnamecount=`expr $groupnamecount + 1`

		fi
		if [ "${gidg}" = "${gidg1}" ];then
		gidcount=`expr $gidcount + 1`

		fi
	done < group #/etc/group
	if [ $groupnamecount -ge 2 ];then
		echo "Duplicate user"
	fi
	if [ $gidcount -ge 2 ];then
		echo "Duplicate UID"
	fi
done < group #/etc/group
