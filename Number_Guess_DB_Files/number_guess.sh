#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUM=$(($RANDOM%1000 + 1))

echo "Enter your username:"
read NAME

# check if user exist
USER_SEARCH_RESULT=$($PSQL "SELECT username FROM user_info WHERE username='$NAME';")

# if user doesn't exist
if [[ -z $USER_SEARCH_RESULT ]]
  then
    # welcome and add them
    echo "Welcome, $NAME! It looks like this is your first time here."
    USER_ADD_RESULT=$($PSQL "INSERT INTO user_info(username, games_played, best_game) VALUES('$NAME', 0, 0);")
  else
    # welcome them and retrieve their stats
    USER_RETRIEVE_RESULT=$($PSQL "SELECT games_played, best_game FROM user_info WHERE username='$NAME';")
    echo $USER_RETRIEVE_RESULT | while IFS='|' read GAMES BEST_GAME
    do
      echo "Welcome back, $NAME! You have played $GAMES games, and your best game took $BEST_GAME guesses."
    done
fi

# ask the user to guess
echo "Guess the secret number between 1 and 1000:"

# store the guess count for output and db storage when done
GUESS_COUNT=0

GUESSFUNC() {
  read GUESS
  
  # if GUESS is not an int, guess again
  if ! [[ $GUESS =~ ^[0-9]+$ ]]
    then
      echo "That is not an integer, guess again:"
      GUESSFUNC
    else
      # if correct guess
      if [ $GUESS -eq $RANDOM_NUM ]; then
        GUESS_COUNT=$((++GUESS_COUNT))

        # retrieve data for updating
        GAMES_RETRIEVE_RESULT=$($PSQL "SELECT games_played, best_game FROM user_info where username='$NAME'")
        echo $GAMES_RETRIEVE_RESULT | while IFS='|' read GAMES BEST_GAME
        do
        # update games played
        GAMES=$((++GAMES))

        # update best game guesses if necessary
        # if no best game stored, update to game just played
        if [ $BEST_GAME -eq 0 ]; then
          BEST_GAME=$((GUESS_COUNT))
          # else update only if current game beats old record
          elif [ $GUESS_COUNT -lt $BEST_GAME ]; then
            BEST_GAME=$((GUESS_COUNT))
        fi
        
        # send updates to db
        DB_UPDATE_RESULT=$($PSQL "UPDATE user_info SET games_played=$GAMES, best_game=$BEST_GAME WHERE username='$NAME';")
        done

        echo "You guessed it in $GUESS_COUNT tries. The secret number was $RANDOM_NUM. Nice job!"
        # if greater than
        elif [ $GUESS -gt $RANDOM_NUM ]; then
        GUESS_COUNT=$((++GUESS_COUNT))
        echo "It's lower than that, guess again:"
        GUESSFUNC
        # if lower than
        elif [ $GUESS -lt $RANDOM_NUM ]; then
        GUESS_COUNT=$((++GUESS_COUNT))
        echo "It's higher than that, guess again:"
        GUESSFUNC
      fi
  fi
}

GUESSFUNC
