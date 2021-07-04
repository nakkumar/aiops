#!/bin/bash
day=$(date +%Y_%m_%d)

mail=
DB_Dump=5
db1=information_schema
db2=mysql
db3=performance_schema
db4=zabbix


if [ $db1 == $DB_Dump ]
then
	
rm -rf /etc/zabbix/db_backup/information_schema_*

echo "Dbdump !!!!"

sudo mysqldump --single-transaction  -u root -pzippyops information_schema > /etc/zabbix/db_backup/information_schema_$day.sql

echo "compress !!!!"

sudo 7z a /etc/zabbix/db_backup/information_schema_$day.zip  /etc/zabbix/db_backup/information_schema_*

sleep 3s

echo "mail send !!!!"

echo "db_dump" | mail -s information_db_dump_$day -a /etc/zabbix/db_backup/information_schema*.zip $mail

#####################

elif [ $db2 == $DB_Dump ]
then

rm -rf /etc/zabbix/db_backup/mysql*

echo "Dbdump !!!!"

sudo mysqldump --single-transaction  -u root -pzippyops mysql > /etc/zabbix/db_backup/mysql_$day.sql

echo "compress !!!!"

sudo 7z a /etc/zabbix/db_backup/mysql_$day.zip  /etc/zabbix/db_backup/mysql*

sleep 3s

echo "mail send !!!!"

echo "db_dump" | mail -s mysql_db_dump_$day -a /etc/zabbix/db_backup/mysql*.zip $mail

#####################

elif [ $db3 == $DB_Dump ]
then

rm -rf /etc/zabbix/db_backup/performance_schema*

echo "Dbdump !!!!"

sudo mysqldump --single-transaction  -u root -pzippyops performance_schema > /etc/zabbix/db_backup/performance_schema_$day.sql

echo "compress !!!!"

sudo 7z a /etc/zabbix/db_backup/performance_schema_$day.zip  /etc/zabbix/db_backup/performance_schema*

sleep 3s

echo "mail send !!!!"

echo "db_dump" | mail -s performance_db_dump_$day -a /etc/zabbix/db_backup/performance_schema*.zip $mail

#####################

elif [ $db4 == $DB_Dump ]
then

rm -rf /etc/zabbix/db_backup/zabbix*

echo "Dbdump !!!!"

sudo mysqldump --single-transaction  -u root -pzippyops zabbix > /etc/zabbix/db_backup/zabbix_$day.sql

echo "compress !!!!"

sudo 7z a /etc/zabbix/db_backup/zabbix_$day.zip  /etc/zabbix/db_backup/zabbix*

sleep 3s

echo "mail send !!!!"

echo "db_dump" | mail -s zabbix_db_dump_$day -a /etc/zabbix/db_backup/zabbix*.zip $mail

####

else

echo "Given DB name is not found !!!"

fi
