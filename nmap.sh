#!/bin/bash

echo "Enter internet domain:"
read string

nmap -A -T4 -F $string
