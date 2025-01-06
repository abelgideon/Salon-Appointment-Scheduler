# Salon Appointment Scheduler

## Overview

This project provides a command-line-based salon appointment scheduling system using a Bash script and PostgreSQL database. Customers can book various salon services, and their information is stored in a PostgreSQL database.

## Features

1. **Service Selection**: Customers can choose from predefined salon services.
2. **Customer Management**: Automatically detects returning customers using their phone number and prompts new customers to enter their details.
3. **Appointment Scheduling**: Allows customers to schedule appointments at their preferred time.
4. **Database Integration**: Stores customer information, services, and appointments in a PostgreSQL database.

## Technologies Used

- **Bash Script**: For the user interface and application logic.
- **PostgreSQL**: For managing customer, service, and appointment data.
- **psql Command-Line Tool**: To execute SQL commands within the Bash script.

## Prerequisites

1. **PostgreSQL**: Ensure PostgreSQL is installed and running.
2. **Database User**: A user named `freecodecamp` with the necessary privileges to interact with the database.
3. **Database**: The database should be named `salon` and include the tables `customers`, `services`, and `appointments`.

## Setup Instructions

1. **Database Initialization**:
   - Copy the SQL dump provided and execute it to set up the database:
     ```bash
     psql --username=freecodecamp --dbname=postgres -f salon.sql
     ```
2. **Grant Permissions**:
   Ensure the user `freecodecamp` has the necessary permissions:
   GRANT ALL PRIVILEGES ON DATABASE salon TO freecodecamp;

3. **Run the Script**:
   Make the script executable and run it:
   ```bash
   chmod +x salon.sh
   ./salon.sh
   ```

## Database Schema

### Tables
1. **customers**:
   - `customer_id` (Primary Key, auto-increment)
   - `phone` (Unique, customer phone number)
   - `name` (Customer's name)

2. **services**:
   - `service_id` (Primary Key, auto-increment)
   - `name` (Service name)

3. **appointments**:
   - `appointment_id` (Primary Key, auto-increment)
   - `customer_id` (Foreign Key, references `customers.customer_id`)
   - `service_id` (Foreign Key, references `services.service_id`)
   - `time` (Appointment time)

## Usage

1. Run the `salon.sh` script.
2. Select a service from the menu.
3. Enter your phone number:
   - If you're a new customer, enter your name when prompted.
4. Provide your preferred appointment time.
5. Confirm your booking.

## Contributing

Contributions are welcome! Fork the repository and submit a Pull Request with your improvements.