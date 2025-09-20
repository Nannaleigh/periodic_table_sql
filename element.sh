#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z "$1" ]]
then 
echo "Please provide an element as an argument."
exit 0
fi

INPUT=$1

if [[ $INPUT =~ ^[0-9]+$ ]]
then
CONDITION="e.atomic_number = $INPUT"
elif [[ ${#INPUT} -le 2 ]]
then 
CONDITION="e.symbol ILIKE '$INPUT'"
else
CONDITION="e.name ILIKE '$INPUT'"
fi

QUERY="SELECT e.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius
FROM elements e
JOIN properties p USING(atomic_number)
JOIN types t USING(type_id)
WHERE $CONDITION;"

RESULT=$($PSQL "$QUERY")

if [[ -z "$RESULT" ]] 

then
echo "I could not find that element in the database."
exit 0
fi

IFS="|" read -r ATOMIC_NUM NAME SYMBOL TYPE MASS MELT BOIL <<< "$RESULT"


echo "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."