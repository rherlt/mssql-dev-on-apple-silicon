DECLARE @DB_BACKUP varchar(max) = N'/mssql/backup/backup.bak'; -- Path to backup file from inside of server container
DECLARE @DB_LOGICALNAME varchar(max) = N'myDatabase'; -- Logical name of backup to restore (mdf)
DECLARE @DB_LOGICALNAME_LOG varchar(max) = N'myDatabase_log'; -- Locical name of backup to restore (ldf)
DECLARE @DB_TARGET_NAME varchar(max) = N'myDatabase'; -- Name of the restored database
DECLARE @DB_TARGET_MDF varchar(max) = N'/var/opt/mssql/data/' + @DB_TARGET_NAME + N'.mdf'; -- Target path of the mdf file after restore
DECLARE @DB_TARGET_LDF varchar(max) = N'/var/opt/mssql/data/' + @DB_TARGET_NAME + N'.ldf'; -- Target path of the ldf file after restore

-- Print everything to see whats going on
print '@DB_BACKUP: '+ @DB_BACKUP;
print '@DB_TARGET_NAME: ' + @DB_TARGET_NAME;
print '@DB_LOGICALNAME: ' + @DB_LOGICALNAME;
print '@DB_LOGICALNAME_LOG: ' + @DB_LOGICALNAME_LOG;
print '@DB_TARGET_MDF: ' + @DB_TARGET_MDF;
print '@DB_TARGET_LDF: ' + @DB_TARGET_LDF;

-- Only restore if database does not exist
IF DB_ID(@DB_TARGET_NAME) IS NULL
BEGIN
    print 'Database with name '+ @DB_TARGET_NAME + ' not found, will do restore!'
    RESTORE FILELISTONLY FROM DISK = @DB_BACKUP
    RESTORE DATABASE @DB_TARGET_NAME
    From disk = @DB_BACKUP
    WITH MOVE @DB_LOGICALNAME TO @DB_TARGET_MDF,
    MOVE @DB_LOGICALNAME_LOG TO @DB_TARGET_LDF
END
ELSE
    print 'Database with name '+ @DB_TARGET_NAME+ ' already exists, skip restore!'
