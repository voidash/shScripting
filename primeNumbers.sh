#!/bin/bash

if [[ $? -eq 0 ]] ; then
exit 1
fi

number=$1
flag=0
for x in $(seq 1 $number)
do 
evalNum=$(expr $number % $x)
if [ $evalNum = '0' ]
then
flag=$(expr $flag + 1)
fi
done
[ $flag = '2' ] && echo "the number is prime" || echo "the number is not prime"
