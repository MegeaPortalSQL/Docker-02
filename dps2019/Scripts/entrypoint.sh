#!/bin/bash
/opt/mssql/bin/sqlservr & 
/var/opt/mssql/backup/certs/CreateAlwaysOn.sh
eval $1
