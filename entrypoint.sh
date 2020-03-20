#!/bin/bash

# Enable bash job control
set -m

# Start sqlservr in background
/opt/mssql/bin/sqlservr &

# Initialise databas
/app/init-db.sh

# Foreground sqlserver
fg %1