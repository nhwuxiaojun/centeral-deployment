#!/bin/bash

###define the spool file
start_interval_time=$1
end_interval_time=$2
tnsname=$3
TNSNAME=$3

###1.checking whether db available###
which tnsping >/dev/null 2>&1
if [ $? -eq 1 ]
then
  echo "EBER-001: tnsping is not found!"
  echo "Please confirm whether Oracle client is installed."
  exit 1
fi
[ ! -z $ORACLE_SID ] || tnsping $TNSNAME >/dev/null 2>&1
if [ $? -eq 1 ]
then
  echo "EBER-002: TNSNAME is not correct or variable ORACLE_SID is not set, target database cannot get connected!"
  echo "Please use \"tnsping TNSNAME\" command check and try again."
  exit 1
fi

spool_file=/usr/local/deploy/awr/$4_${start_interval_time}_${end_interval_time}.html

sqlplus -s dbadmin/dbadmin@$tnsname << EOF
set echo off
set veri off
set feedback off
set termout on
set heading off
set linesize 9000
set termout off

var v_begin_snap_id NUMBER;
var v_end_snap_id   NUMBER;
var v_dbid          NUMBER;


exec SELECT dbid INTO :v_dbid FROM v\$database;

begin
SELECT MIN(snap_id), MAX(snap_id)
 INTO :v_begin_snap_id,:v_end_snap_id
 FROM dba_hist_snapshot
WHERE end_interval_time >= to_date('${start_interval_time}', 'yyyymmddhh24mi')
  and end_interval_time <= to_date('${end_interval_time}', 'yyyymmddhh24mi')+3/1440;
end;
/


spool $spool_file
select output from table(dbms_workload_repository.AWR_REPORT_HTML(:v_dbid,1,:v_begin_snap_id,:v_end_snap_id,0));
spool off;
quit
EOF

###05 */2 * * * sh /home/oracle2/get_awr.sh
###This script is run at 05 every 2 hours
awr_file=$4_${start_interval_time}_${end_interval_time}
cd /usr/local/deploy/awr/
zip ${awr_file}.zip ${awr_file}.html
echo "AWR for DB $3"|email -a ${awr_file}.zip -s "AWR for DB:${tnsname} $1-$2, Environment: ${5}" -f "AWR_Generator@ebaotech.com"  $6@ebaotech.com
