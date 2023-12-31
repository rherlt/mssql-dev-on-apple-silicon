# mssql-dev-on-apple-silicon
Boilerplate docker compose file to run a docker image and restore a MSSQL Backup on Apple Silicon

# Based on
1. [Azure SQL Edge](https://hub.docker.com/_/microsoft-azure-sql-edge) as a mac compatible replacement for mssql server.
2. [sqlcmd from microsoft-mssql-tools](https://hub.docker.com/_/microsoft-mssql-tools) as mssql client command line tool to run mssql scripts.
3. [adminer](https://hub.docker.com/_/adminer/) as webbased client to display mssql server.
4. [Northwind](https://github.com/cjlee/northwind) Microsofts sample MSSQL database for demonstration purposes.

# Steps to go:
1. Clone the repository
2. Get the MSSQL database backup that you want to restore
3. Put the database backup file to folder [bak](./bak)
4. Open [restore_backup.sql](./scripts/restore_backup.sql) and adjust the first four arguments acording to your datbase (filename, backup name, etc...)
5. Run ```docker compose up``` to start everything. See docker compose file for SA user credentials to login. The database will have the name as defined in the variable ```@DB_TARGET_NAME``` in [restore_backup.sql](./scripts/restore_backup.sql)
6. Run ```docker compose down -v``` to reset everything (and to delete the database)