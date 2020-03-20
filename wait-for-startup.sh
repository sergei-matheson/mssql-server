#!/bin/bash
set -eu

PATH=/opt/mssql-tools/bin:$PATH
success=0
timeout=90
echo -n "Waiting for mssql to start"
for i in `seq $timeout`; do
  echo -n '.'
  sqlcmd -H localhost -U sa -P $SA_PASSWORD \
    -Q "select * from information_schema.tables;" 2> /dev/null && \
    success=0 && break || success=$? && sleep 1
done;
echo
exit $success
