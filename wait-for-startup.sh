#!/bin/bash
set -eu

PATH=/opt/mssql-tools/bin:$PATH
success=0
timeout=90
for i in `seq $timeout`; do
  echo "Waiting for mssql to start: ${i} of ${timeout}"
  sqlcmd -H localhost -U sa -P $SA_PASSWORD \
    -Q "select * from information_schema.tables;" 2> /dev/null && \
    success=0 && break || success=$? && sleep 1
done;
exit $success