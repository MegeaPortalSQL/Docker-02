#!/bin/bash

# wait for MSSQL server to start
export STATUS=1
i=0

while [[ $STATUS -ne 0 ]] && [[ $i -lt 30 ]]; do
	i=$i+1
	sqlcmd -S db3.internal.portalsql.es  -U sa -P 'PortalSQL01Demo#' -Q "select 1" >> /dev/null
	
	STATUS=$?
	sqlcmd -S db2.internal.portalsql.es  -U sa -P 'PortalSQL01Demo#' -Q "select 1" >> /dev/null
	STATUS=STATUS+$?
	
	sqlcmd -S db1.internal.portalsql.es  -U sa -P 'PortalSQL01Demo#' -Q "select 1" >> /dev/null
	STATUS=STATUS+$?
	sleep 1s
done

if [ $STATUS -ne 0 ]; then 
	echo "Error: MSSQL SERVER took more than thirty seconds to start up."
	exit 1
fi

echo "======= MSSQL SERVER STARTED ========" 

if [ -f /var/opt/mssql/backup/certs/dbm_certificate.cer ]
then
echo "NOTHING TO DO"
else
sqlcmd -S db1.internal.portalsql.es -U SA -P 'PortalSQL01Demo#' -i 01_PrincipalServer.sql
sqlcmd -S db2.internal.portalsql.es -U SA -P 'PortalSQL01Demo#' -i 02_SecondaryServer.sql
sqlcmd -S db3.internal.portalsql.es -U SA -P 'PortalSQL01Demo#' -i 02_SecondaryServer.sql
sqlcmd -S db1.internal.portalsql.es -U SA -P 'PortalSQL01Demo#' -i 03_CreateAvailabilityGroup.sql
sqlcmd -S db2.internal.portalsql.es -U SA -P 'PortalSQL01Demo#' -i 04_JoinAvailabilityGroup.sql
sqlcmd -S db3.internal.portalsql.es -U SA -P 'PortalSQL01Demo#' -i 04_JoinAvailabilityGroup.sql
sqlcmd -S db1.internal.portalsql.es -U SA -P 'PortalSQL01Demo#' -i RestoreAdventureWorksDWandPutitAvailable.sql
fi
