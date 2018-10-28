#!/bin/bash

#for any files that have write access by anyone other than root in etc
for i in `find /etc -type f -perm 222` 
do
echo "filename "$i
echo "ownwer is "`stat -c "%u" $i`
echo `ls -l readetc.sh --color | awk '{print  " " $3}'` # to print name of the owner
#display permission on the current file

# To find out if file has write permission or not
[ -w $i ] && W="Write = yes" || W="Write = No"
 
# find out if file has excute permission or not
[ -x $i ] && X="Execute = yes" || X="Execute = No"
 
# find out if file has read permission or not
[ -r $i ] && R="Read = yes" || R="Read = No"
 
echo "$i permissions"
echo "$W"
echo "$R"
echo "$X"
done

#Check if any files have been modified since 6pm the previous day.
touch -t `date --date='1 day ago 6pm' +%m%d0000` /tmp/$$ # to create a file at 6pm for comparisns
find /etc -type f -newer /tmp/$$  # to find files modified after /tmp/$$
