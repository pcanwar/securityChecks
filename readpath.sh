#!/bin/bash

curdir=`$pwd`
if [ `echo $PATH |grep "$curdir"` ]; then
echo "Current directory exists in PATH"
else
echo "Not Found"
fi

str=`expr $PATH`

dir1=`echo $str | awk -F":" '{print $1}'`
dir2=`echo $str | awk -F":" '{print $2}'`
dir3=`echo $str | awk -F":" '{print $3}'`
dir4=`echo $str | awk -F":" '{print $4}'`
dir5=`echo $str | awk -F":" '{print $5}'`
dir6=`echo $str | awk -F":" '{print $6}'`
echo $dir1 $dir2 $dir3 $dir4 $dir5 $dir6

echo "files with setuid bit on and writable by non-owner "
for i in `find $dir1 -perm /o=w,o=s` # setuid bit on and writable by non-owner first,
do
echo $i
done 
for i in `find $dir2 -perm /o=w,o=s` # setuid bit on and writable by non-owner first,
do
echo $i
done 
for i in `find $dir3 -perm /0=w,o=s` # setuid bit on and writable by non-owner first,
do
echo $i
done 
for i in `find $dir4 -perm /o=w,o=s` # setuid bit on and writable by non-owner first,
do
echo $i
done 
for i in `find $dir5 -perm /o=w,o=s` # setuid bit on and writable by non-owner first,
do
echo $i
done 


echo "setuid bit on but only writable by the owner  "

for i in `find $dir1 -perm /u=w,u=s` # setuid bit on but only writable by the owner second, and
do
echo $i
done 
for i in `find $dir2 -perm /u=w,u=s` # setuid bit on but only writable by the owner second, and
do
echo $i
done 
for i in `find $dir3 -perm /u=w,u=s` # setuid bit on but only writable by the owner second, and
do
echo $i
done 
for i in `find $dir4 -perm /u=w,u=s` # setuid bit on but only writable by the owner second, and
do
echo $i
done 
for i in `find $dir5 -perm /u=w,u=s` # setuid bit on but only writable by the owner second, and
do
echo $i
done 



echo "setuid bit off and writable by non-owner   "

for i in `find $dir1 -perm /0022` # setuid bit off and writable by non-owner   
do
echo $i
done 
for i in `find $dir2 -perm /0022` # setuid bit off and writable by non-owner   
do
echo $i
done 
for i in `find $dir3 -perm /0022` # setuid bit off and writable by non-owner   
do
echo $i
done 
for i in `find $dir4 -perm /0022` # setuid bit off and writable by non-owner   
do
echo $i
done 
for i in `find $dir5 -perm /0022` # setuid bit off and writable by non-owner   
do
echo $i
done 
