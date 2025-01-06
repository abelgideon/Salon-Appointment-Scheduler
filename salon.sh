#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"
echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  echo -e "Welcome to My Salon, how can I help you?"
  echo -e "\n1) Haircut\n2) Hairwash\n3) Haircut and Beard"
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
    1) HANDLE_SERVICE ;;
    2) HANDLE_SERVICE ;;
    3) HANDLE_SERVICE ;;
    *) MAIN_MENU "Please enter a valid choice" ;;
  esac
}

HANDLE_SERVICE() {
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nWhat's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  fi
  echo -e "\nWhat time would you like to schedule your appointment?"
  read SERVICE_TIME
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  SET_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}

MAIN_MENU