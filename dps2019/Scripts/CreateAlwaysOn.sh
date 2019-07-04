
sqlcmd -S db1.internal.portalsql.es -U SA -P 'PortalSQL01Demo#' -i 01_PrincipalServer.sql
sqlcmd -S db2.internal.portalsql.es -U SA -P 'PortalSQL01Demo#' -i 02_SecondaryServer.sql
sqlcmd -S db3.internal.portalsql.es -U SA -P 'PortalSQL01Demo#' -i 02_SecondaryServer.sql
sqlcmd -S db1.internal.portalsql.es -U SA -P 'PortalSQL01Demo#' -i 03_CreateAvailabilityGroup.sql
sqlcmd -S db2.internal.portalsql.es -U SA -P 'PortalSQL01Demo#' -i 04_JoinAvailabilityGroup.sql
sqlcmd -S db3.internal.portalsql.es -U SA -P 'PortalSQL01Demo#' -i 04_JoinAvailabilityGroup.sql

