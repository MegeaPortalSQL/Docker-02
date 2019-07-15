
IF NOT EXISTS
(
    SELECT *
    FROM sys.databases
    WHERE name = 'AdventureWorksDW2017'
)
    BEGIN
        RESTORE DATABASE [AdventureWorksDW2017] FROM DISK = N'/var/opt/mssql/backup/AdventureWorksDW2017.bak' WITH FILE = 1, MOVE N'AdventureWorksDW2017' TO N'/var/opt/mssql/data/AdventureWorksDW2017.mdf', MOVE N'AdventureWorksDW2017_log' TO N'/var/opt/mssql/data/AdventureWorksDW2017_log.ldf', NOUNLOAD, STATS = 5;
        ALTER DATABASE [AdventureWorksDW2017] SET RECOVERY FULL;
        BACKUP DATABASE [AdventureWorksDW2017] TO DISK = 'aw17.bak';
        ALTER AVAILABILITY GROUP Ag1 ADD DATABASE [AdventureWorksDW2017];
END;
