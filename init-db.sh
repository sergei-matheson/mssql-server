#!/bin/bash
set -e

./wait-for-startup.sh

if [ -n "${DATABASE_NAME}" ]
then
  echo "Creating database ${DATABASE_NAME}"
  /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -d master -Q "CREATE DATABASE ${DATABASE_NAME};"
  echo "Finished creating database ${DATABASE_NAME}"
fi

if [ -n "${DATABASE_SETUP_FILE}" ]
then
  echo "Running database setup file ${DATABASE_SETUP_FILE}"
  /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -d master -i ${DATABASE_SETUP_FILE}
  echo "Finished running database setup file ${DATABASE_SETUP_FILE}"
fi
