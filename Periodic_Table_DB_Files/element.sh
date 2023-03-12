#!/bin/bash

# takes an atomic number, symbol, or name, and gives more info about the element if found

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# if arg not provided
if [[ -z $1 ]]
  then
    echo Please provide an element as an argument.
  else
    # run input against the db
    ELEMENT_QUERY_RESULT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements FULL JOIN properties USING(atomic_number) FULL JOIN types USING(type_id) WHERE symbol='$1' OR name='$1' OR atomic_number::text LIKE '$1';")
    
    # if elem not found
    if [[ -z $ELEMENT_QUERY_RESULT ]]
          then
            echo "I could not find that element in the database."
          else
            # else return the element
            echo $ELEMENT_QUERY_RESULT | while IFS='|' read ATOMIC_NUM NAME SYMBOL TYPE MASS MELTING_PNT BOILING_PNT
            do
              echo "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_PNT celsius and a boiling point of $BOILING_PNT celsius."
            done
        fi
fi

