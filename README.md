# MSSQL Server that creates a database on startup.

Start a mssql-server instance that creates an empty database called "my-database":

```sh
docker run -e 'ACCEPT_EULA=Y' \ 
  -e 'SA_PASSWORD=yourStrong(!)Password' \
  -e 'DATABASE_NAME=my-database' \
  -p 1433:1433 -d sergeimatheson/mssql-server:latest
```

## Configuration

This image requires Docker Engine 1.8+ in any of their supported platforms.

At least 2GB of RAM (3.25 GB prior to 2017-CU2). Make sure to assign enough memory to the Docker VM if you're running on Docker for Mac or Windows.

Requires the following environment flags

ACCEPT_EULA=Y

SA_PASSWORD=<your_strong_password>

DATABASE_NAME=<name_of_db_to_create_on_startup>

See base image at [https://hub.docker.com/\_/microsoft-mssql-server](https://hub.docker.com/_/microsoft-mssql-server) for further details.
