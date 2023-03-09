#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ Welcome to Scissorhands ~~~~~\n"

MAIN_MENU() {
echo -e "How may I help you?\n" 

SERVICE_SELECTION
}

SERVICE_SELECTION() {
  if [[ $1 ]]
    then
    echo -e "\n$1"
  fi

  # lists all available services from the database
  SERVICE_LIST=$($PSQL "SELECT * FROM services")
  echo "$SERVICE_LIST" | while read SERVICE_ID BAR SERVICE
  do
    echo "$SERVICE_ID) $SERVICE"
  done

  read SERVICE_ID_SELECTED

  # check if service exists
  SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")

  # if not, warn and send to menu
  if [[ -z $SERVICE_ID ]]
    then
      SERVICE_SELECTION "That service does not exist, please select an available service"
    else
      SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID")

      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE
      
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

      # if customer does not exist in the db, add them.
      if [[ -z $CUSTOMER_ID ]]
        then
          echo -e "\nThere is no record of that phone number. What is your name?"
          read CUSTOMER_NAME

          CUSTOMER_ADD_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
          CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
        else
          CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id=$CUSTOMER_ID")
      fi

      # get a time for the appointment
      APPOINTMENT_FORMATTED=$(echo $SERVICE_NAME, $CUSTOMER_NAME | sed 's/  +/ /g')
      echo -e "\nWhat time would you like your $APPOINTMENT_FORMATTED?"
      read SERVICE_TIME
      
      SERVICE_ID_FORMAT=$(echo $SERVICE_ID | sed 's/ +//g')
      CUSTOMER_ID_FORMAT=$(echo $CUSTOMER_ID | sed 's/ +//g')
      MAKE_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID_FORMAT, $SERVICE_ID_FORMAT, '$SERVICE_TIME')")
      echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed 's/  +//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed 's/  +//g')."
  fi

}

MAIN_MENU
