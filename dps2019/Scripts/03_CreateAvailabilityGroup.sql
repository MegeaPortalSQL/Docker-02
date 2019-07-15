
IF NOT EXISTS
(
    SELECT *
    FROM sys.availability_groups
    WHERE name = 'ag1'
)
    BEGIN
	CREATE AVAILABILITY GROUP [ag1]
     WITH (DB_FAILOVER = ON, CLUSTER_TYPE = EXTERNAL)
     FOR REPLICA ON
         N'PortalSQLNode1' 
          WITH (
             ENDPOINT_URL = N'tcp://db1.internal.portalsql.es:5022',
             AVAILABILITY_MODE = SYNCHRONOUS_COMMIT,
             FAILOVER_MODE = EXTERNAL,
             SEEDING_MODE = AUTOMATIC
             ),
         N'PortalSQLNode2' 
          WITH ( 
             ENDPOINT_URL = N'tcp://db2.internal.portalsql.es:5022', 
             AVAILABILITY_MODE = SYNCHRONOUS_COMMIT,
             FAILOVER_MODE = EXTERNAL,
             SEEDING_MODE = AUTOMATIC
             ),
         N'PortalSQLNode3'
         WITH( 
            ENDPOINT_URL = N'tcp://db3.internal.portalsql.es:5022', 
            AVAILABILITY_MODE = SYNCHRONOUS_COMMIT,
            FAILOVER_MODE = EXTERNAL,
            SEEDING_MODE = AUTOMATIC
            );

ALTER AVAILABILITY GROUP [ag1] GRANT CREATE ANY DATABASE;
ALTER AVAILABILITY GROUP AG1 SET (HEALTH_CHECK_TIMEOUT =60000);
END;
