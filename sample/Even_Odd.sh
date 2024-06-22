#!/bin/bash

# program to find Even or Odd in range of numbers
read -p "Enter the start of range:" start

read -p "Enter the end of range: " end

even_numbers=""
odd_numbers=""

#for i in {1..10};do
for ((i = start; i <= end; i++));do
	
if [ `expr $i % 2 ` == 0 ];
   then 
	   even_numbers+="\n $i"
   else
	   odd_numbers+="\n $i"
fi;
done

echo -e "Even Numbers:$even_numbers"
echo -e "Odd Numbers:$odd_numbers"
