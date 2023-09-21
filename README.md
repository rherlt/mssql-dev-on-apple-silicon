# mssql-dev-on-apple-silicon
Boilerplate docker compose file to run a docker image and restore a MSSQL Backup on Apple Silicon

# Steps to go:
1. Get the MSSQL database backup that you want to restore
2. Put the database backup file to folder [bak](./bak)] and rename it to ```backup.bak```
3. Run ```docker compose up``` to start everything. See docker compose file for SA user credentials to login. The database will have the name as defined in the variable ```@DB_TARGET_NAME``` in [restore_backup.sql](./scripts/restore_backup.sql) (```myDatabase``` as default)
4. Run ```docker compose down -v``` to reset everything (and to delete the database)