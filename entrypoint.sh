#!/bin/bash

# Enable bash job control
set -m

if [ -z "${SA_PASSWORD}" ]
then
  >&2 echo 'No SA password found. Please set SA_PASSWORD env var'
  exit 1
fi

# Start sqlservr in background
/opt/mssql/bin/sqlservr &

# Initialise databas
/app/init-db.sh

# Foreground sqlserver
fg %1
