#!/bin/bash
set -eu

./wait-for-startup.sh

/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $SA_PASSWORD -d master -Q "CREATE DATABASE ${DATABASE_NAME};"