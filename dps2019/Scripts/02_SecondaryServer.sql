
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'PortalSQL01Demo#';


create CERTIFICATE dbm_certificate 
from FILE = '/var/opt/mssql/backup/certs/dbm_certificate.cer' 
WITH PRIVATE KEY(FILE = '/var/opt/mssql/backup/certs/dbm_certificate.pvk' 
						, DECRYPTION BY PASSWORD = 'PortalSQL01Demo#');

CREATE ENDPOINT [Hadr_endpoint] 
AS TCP(LISTENER_PORT = 5022) 
FOR DATABASE_MIRRORING ( ROLE = ALL , 
AUTHENTICATION = CERTIFICATE dbm_certificate , 
ENCRYPTION = REQUIRED ALGORITHM AES);

ALTER ENDPOINT [Hadr_endpoint] STATE = STARTED;

