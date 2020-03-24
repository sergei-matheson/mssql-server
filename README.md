# MSSQL Server that allows database setup on startup.

Start a mssql-server instance that creates an empty database called "my-database":

```sh
docker run -e 'ACCEPT_EULA=Y' \
  -e 'SA_PASSWORD=yourStrong(!)Password' \
  -e 'DATABASE_NAME=my-database' \
  -p 1433:1433 -d sergeimatheson/mssql-server:latest
```

Start a mssql-server instance that runs an SQL setup file:

```sh
docker run \
  -v /tmp/db-creation:/db-creation \
  -e 'ACCEPT_EULA=Y' \
  -e 'SA_PASSWORD=yourStrong(!)Password' \
  -e 'DATABASE_SETUP_FILE=/db-creation/schema.sql' \
  -p 1433:1433 -d sergeimatheson/mssql-server:latest
```

Start a mssql-server instance that creates an empty database called "my-database" and *then* runs an SQL setup file:

```sh
docker run \
  -v /tmp/db-creation:/db-creation \
  -e 'ACCEPT_EULA=Y' \
  -e 'SA_PASSWORD=yourStrong(!)Password' \
  -e 'DATABASE_NAME=my-database' \
  -e 'DATABASE_SETUP_FILE=/db-creation/schema.sql' \
  -p 1433:1433 -d sergeimatheson/mssql-server:latest
```

## Configuration

This image requires Docker Engine 1.8+ in any of their supported platforms.

At least 2GB of RAM (3.25 GB prior to 2017-CU2). Make sure to assign enough memory to the Docker VM if you're running on Docker for Mac or Windows.

Requires the following environment vars:

ACCEPT_EULA=Y

SA_PASSWORD=your_strong_password

The following environment vars are optional:

DATABASE_NAME=name_of_db_to_create_on_startup

DATABASE_SETUP_FILE=path_to_sql_file_to_run_on_startup

See base image at [https://hub.docker.com/\_/microsoft-mssql-server](https://hub.docker.com/_/microsoft-mssql-server) for further details.
