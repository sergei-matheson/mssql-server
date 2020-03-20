FROM mcr.microsoft.com/mssql/server:2017-CU19-ubuntu-16.04

RUN mkdir -p /app
WORKDIR /app

COPY . /app

CMD /bin/bash ./entrypoint.sh