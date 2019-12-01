#!/bin/bash

#prints sum of 10 even numbers

#Main learning points
#How x = 1 is different from x= 1 in scripting
#function {1..100} is not available in /bin/sh but available in /bin/sh
#if [<space>case<space>]


#links https://stackoverflow.com/questions/2268104/command-not-found-error-in-bash-variable-assignment



sum=0
for x in {1..10}
do 
	modfind=`expr $x % 2`
	if [ $modfind -eq 0 ]
	then
		sum=`expr $sum + $x` #can't be $sum
	fi
done
echo $sum

