#!/bin/bash

# This file opens a file i n(i) time(s).
# It takes many pairs arguments as filename1 number1 filename2 number2 ... and opens filename1 number1 times, opens filename2 number2 times etc.



# The following function executes a defined action which is "echo" according to the value of its first argument which is an integer

Action(){
	error_msg=${1:?"Usage : number name_of_file"}
 	i=0
	while [[ $i -lt $1 ]] ; do
		echo "$2"
		i=$((i + 1))
	done
}

# Function to test if a number is an integer or not

test_if_integer_on(){
     [[ $1 =~ ^-?[0-9]+$ ]]
}


# Constant : total number of arguments
N=$#

# Variable : counter
i=1

# In the first bloc if...then of loop for, if argument k is an existing file then it is attributed to "name_of_file". If the argument k is a number then it is attributed to "weight".
# Hence, "name_of_file" should contain argument k while "weight" should contain argument k+1. And so "Action" should be executed with argument k+1 and argument k.

for k in $@ ; do
	if [ -f $k ] ; then
		name_of_file=$k
	else test_if_integer_on $k
		weight=$k
	fi
	if [ -n $name_of_file ] && [[ $weight -gt 0 ]] ; then
		Action $weight $name_of_file
		weight=0
	fi
done


