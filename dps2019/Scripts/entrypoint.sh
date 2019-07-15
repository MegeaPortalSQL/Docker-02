#!/bin/bash
/opt/mssql/bin/sqlservr & 
/var/opt/mssql/backup/CreateAlwaysOn.sh
eval $1
