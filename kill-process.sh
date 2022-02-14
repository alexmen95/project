#!/bin/bash

echo "Welcome to 'stopping the program'"
echo "Enter the name of program: "
read program
ps -ef | grep $program


echo " "
echo "Enter the number of process: "
read process
kill -9 $process
