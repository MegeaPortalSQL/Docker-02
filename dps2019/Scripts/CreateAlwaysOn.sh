
sqlcmd -S db1.portalsql.es -U SA -P 'PortalSQL01Demo#' -i 01_PrincipalServer.sql
sqlcmd -S db2.portalsql.es -U SA -P 'PortalSQL01Demo#' -i 02_SecondaryServer.sql
sqlcmd -S db3.portalsql.es -U SA -P 'PortalSQL01Demo#' -i 02_SecondaryServer.sql
sqlcmd -S db1.portalsql.es -U SA -P 'PortalSQL01Demo#' -i 03_CreateAvailabilityGroup.sql
sqlcmd -S db2.portalsql.es -U SA -P 'PortalSQL01Demo#' -i 04_JoinAvailabilityGroup.sql
sqlcmd -S db3.portalsql.es -U SA -P 'PortalSQL01Demo#' -i 04_JoinAvailabilityGroup.sql

