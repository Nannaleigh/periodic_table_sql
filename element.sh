#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z "$1"]];
then 
echo "Please provide an element as an argument."
exit 0
fi

INPUT=$1

if [[ $INPUT =~ ^[0-9]+$ ]]
then
CONDITION="e.atomic_number = $INPUT";
elif [[ ${#INPUT} -le 2 ]]
then 
CONDITION="e.symbol ILIKE '$INPUT'";
else
CONDITION="e.name ILIKE '$INPUT'";
fi