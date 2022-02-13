#!/bin/bash

# Helpful program which helps to go around the code

function goto {
	label=$1
	cmd=$(sed -n "/^:[[:blank:]][[:blank:]]*${label}/{:a;n;p;ba};" $0 | grep -v ':$')
        eval "$cmd"
        exit
}

# Beginning of program
echo "Hello to program bash ping."
: start
echo "Enter the number of inputs:"
read number
echo "Enter the name of the internet domain:"
read string

re='^[0-9]+$'
d=`date +%d.%m.%Y`
dh=`date +%H:%M:%S`
dr=" "

if ! [[ $number =~ $re ]]; then 
	echo -e "\e[1;31m Error! You did not enter a proper number! Please try again! \e[0m"; goto "start"
fi

: check
echo "Do you want to save the results on text file 'test.txt' ? Y = yes , N = no !?"
read ch

if [[ $ch = "Y" || $ch = "y" ]]; then
	echo " " >> "test.txt"
	echo "############################################################################" >> "test.txt"
	echo " " >> "test.txt"
	echo "The time taken to ping $string $d$dr$d" >> "test.txt"
	echo " " >> "test.txt"
	ping -c $number $string >> "test.txt"	
elif [[ $ch  = "N" || $ch = "n" ]]; then 
	echo "The time taken for $string $d$dr$dh"
	ping -c $number $string
else 
	echo -e "\e[1;31m You have written something different. Please try again, but properly! \e[0m"
       	goto "check"
fi

# Checking construction to continue working or to quit
echo " "
echo -e "\e[1;31m Do you want to continue to work? Press on keyboard: Y = yes 'to continue to work' or N = no - 'to finish'? \e[0m"
read ans

if [[ $ans = "Y" || $ans = "y" ]]; then
	goto "start"
elif [[ $ans = "N" || $ans = "n" ]]; then 
	echo -e "\e[1;31m This is the result! Thank you and goodbye! \e[0m"
fi
