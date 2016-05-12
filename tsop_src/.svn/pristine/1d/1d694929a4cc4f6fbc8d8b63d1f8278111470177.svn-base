#!/bin/sh
# Script name : upgrade_db.sh
# Date : 2014/07/22
# Version : 2.0
# Author: Jiangtao Chen
# Merge test

export DT=`date +%Y%m%d_%H-%M-%S`
export V_LOG=`date +%Y%m%d_%H%M%S`_upgrade_$1_db.log
export V_MVN_LOG=maven.log
export NLS_LANG=AMERICAN_AMERICA.UTF8
export PKG_PATH=$(cd "$(dirname "$0")"; pwd)

#BOOTUP="color"
RES_COL=60
MOVE_TO_COL="echo -en \\033[${RES_COL}G"
SETCOLOR_SUCCESS="echo -en \\033[1;32m"
SETCOLOR_FAILURE="echo -en \\033[1;31m"
SETCOLOR_WARNING="echo -en \\033[1;33m"
SETCOLOR_NORMAL="echo -en \\033[0;39m"
ECHO="echo -en"
[ `uname` = "AIX" ] && ECHO="echo"

echo_skip() {
if [ `uname` = "AIX" ]; then
  echo "[\033[1;32m SKIPPED \033[0m]"
else
  [ "$BOOTUP" = "color" ] && $MOVE_TO_COL
  echo -n "[  "
  [ "$BOOTUP" = "color" ] && $SETCOLOR_SUCCESS
  echo -n $"SKIPPED"
  [ "$BOOTUP" = "color" ] && $SETCOLOR_NORMAL
  echo -n "  ]"
  echo -ne "\r"
fi
  return 0
}

echo_success() {
if [ `uname` = "AIX" ]; then
  echo "[\033[1;32m SUCCEED \033[0m]"
else
  [ "$BOOTUP" = "color" ] && $MOVE_TO_COL
  echo -n "[  "
  [ "$BOOTUP" = "color" ] && $SETCOLOR_SUCCESS
  echo -n $"SUCCEED"
  [ "$BOOTUP" = "color" ] && $SETCOLOR_NORMAL
  echo -n "  ]"
  echo -ne "\r"
fi
  return 0
}

echo_failure() {
if [ `uname` = "AIX" ]; then
  echo "[\033[1;31m FAILED \033[0m]"
else
  [ "$BOOTUP" = "color" ] && $MOVE_TO_COL
  echo -n "[  "
  [ "$BOOTUP" = "color" ] && $SETCOLOR_FAILURE
  echo -n $"FAILED"
  [ "$BOOTUP" = "color" ] && $SETCOLOR_NORMAL
  echo -n "   ]"
  echo -ne "\r"
fi
  return 1
}


usage() {
echo "=============================================================="
[ ! -f upgrade-db.xml ] && echo "Usage: sh $0 <username> <password> [<@tnsname>]"
[ -f upgrade-db.xml ] && echo "Usage: sh $0 <username> <password> <JDBC_URL>"
echo "--------------------------------------------------------------"
[ ! -f upgrade-db.xml ] && echo "Example: sh $0 ebao_system ebao_systempwd @ebaodb"
[ -f upgrade-db.xml ] && echo "Example: sh $0 ebao_system ebao_systempwd jdbc:oracle:thin:@172.16.7.150:1521:ebaodb"
echo "=============================================================="
exit 1
}

# To support old deployment script outside folder db.
test -d ${PKG_PATH}/db && { cd ${PKG_PATH}/db; cp ../upgrade_db.sh .; sh upgrade_db.sh $1 $2 $3 ; } && exit

test ! -z $ORACLE_SID && TNSNAME=$ORACLE_SID
test ! -z $3 && TNSNAME=$3
test ! -z $3 && echo $3|grep -q @ && TNSNAME=`echo $3|cut -c2-`

echo "$1$2$3$4$5$6$7$8$9$10"|grep -qE '(\-owner|\-appuser|\-readuser|\-tnsname|\-seq_value)' && { echo "Sorry, The parameter specified is supported any more."; usage;  }
test $# -lt 2 && usage
test $# -gt 4 && usage

export user_name_1=$1
export password_1=$2
export tnsname_1=$3
test ! -z $3 && echo $3 |grep -vq @ && export tnsname_1=@$3
export lang=$4

# For back compatibility 
export owner_user=${user_name_1}
export owner_pwd=${password_1}
export TNS=${tnsname_1}

if [ -f upgrade-db.xml ];then
  if [ "`echo ${tnsname_1}|cut -c -16`" == "jdbc:oracle:thin" ]; then
  ###MVN:1.check JAVA###
    $JAVA_HOME/bin/java -version 2>${PKG_PATH}/${V_LOG}
    if [  $?  -ne  0 ]
    then
      echo "EBER-001:JAVA_HOME in environment variable is not available!"
      exit 1
    fi
      version=`$JAVA_HOME/bin/java -version 2>&1`
      if [ "`echo ${version}|cut -c 17`" -lt "6" ]; then
        echo "EBER-001: JDK version must be 1.6 or above, if upgrade with maven."
        echo "Please install JDK 1.6 or above."
        usage
        exit 1
      else
        export JAVA_HOME=$JAVA_HOME
        export PATH=$PATH:$JAVA_HOME/bin
      fi
    else
      version=`java -version 2>&1`
      if [ "`echo ${version}|cut -c 17`" -lt "6" ]; then
        echo "EBER-001: JDK version must be 1.6 or above, if upgrade with maven."
        echo "Please install JDK 1.6 or above."
        usage
        exit 1
      fi
    fi
  ###MVN:2.Set MAVEN HOME###
    export MAVEN_HOME=${PKG_PATH}/maven
    export PATH=$PATH:$MAVEN_HOME/bin
    chmod -R 777 ${MAVEN_HOME}
  ###MVN:3.Check MAVEB###
    echo "Start deploying Package to DB ${user_name_1}/***${tnsname_1}..."  |tee -a ${PKG_PATH}/${V_LOG}
    mvn -v >> ${PKG_PATH}/${V_LOG} 2>&1
    if [  $?  -ne  0 ]
    then
      echo "EBER-002: MAVEN is not available!"
      exit 1
    fi
  ###MVN:4.deploy mvn ###
    export MAVEN_OPTS=-Xmx1024m
    if [ $4 ]; then
      LIQUIBASE_COMMOND=$4
    else
      LIQUIBASE_COMMOND="update2"
    fi
    LIQUIBASE_CHANGELOGFILE="upgrade-db.xml"
    echo " "
    echo "Detail Maven log:${PKG_PATH}/${V_MVN_LOG}" | tee -a ${PKG_PATH}/${V_LOG}
    ${ECHO} "Upgrade db with MAVEN......"
    mvn liquibase:${LIQUIBASE_COMMOND} -o -s settings.xml -Durl=${tnsname_1} -Dusername=${user_name_1} -Dpassword=${password_1} -DchangeLogFile=${LIQUIBASE_CHANGELOGFILE} > ${V_MVN_LOG} 2>&1
    if [ $? -ne 0 ]
    then
      echo_failure  |tee -a ${PKG_PATH}/${V_LOG}
      echo ""
      echo ""
      echo "Dbscript or plsql was deployed with error, please check log for detailes."
      echo "Log file: ${PKG_PATH}/${V_LOG}"
      exit 1
    else
      echo_success |tee -a ${PKG_PATH}/${V_LOG}
      echo ""
      echo ""
      echo "eBaoTech Insurance System DB Package was deployed successfully!"
      exit 0
    fi
  else
    echo "EBER-003:JDBC URL error!"
    echo "Please enter correct JDBC URL, if upgrade with maven"
    usage
    exit 1
  fi
fi

if [ ! -f upgrade-db.xml ];then
  if [ "`echo ${tnsname_1}|cut -c -16`" == "jdbc:oracle:thin" ]; then
    echo "EBER-004:This Package is not for maven"
    usage
    exit 1
  fi
fi

###1.checking whether db available###
which tnsping >/dev/null 2>&1
if [ $? -eq 1 ]
then
  echo "EBER-001: tnsping is not found!"
  echo "Please confirm whether Oracle client is installed."
  usage
  exit 1
fi
[ ! -z $ORACLE_SID ] || tnsping $TNSNAME >/dev/null 2>&1
if [ $? -eq 1 ]
then
  echo "EBER-002: TNSNAME is not correct or variable ORACLE_SID is not set, target database cannot get connected!"
  echo "Please use \"tnsping TNSNAME\" command check and try again."
  usage
  exit 1
fi

###2.checking whether credential is correct###
which sqlplus >/dev/null 2>&1
if [ $? -eq 1 ]
then
  echo "EBER-003: sqlplus is not found!"
  echo "Please confirm whether Oracle client is installed."
  usage
  exit 1
fi
sqlplus -L ${user_name_1}/${password_1}${tnsname_1} <<EOF >/dev/null 2>&1
quit
EOF
if [ $? -eq 1 ]
then
  echo "EBER-004: Database credentials not correct, target database cannot get connected!"
  echo "Please confirm your credentials and try again."
  usage
  exit 1
fi

echo "Start deploying Package to DB ${user_name_1}/***${tnsname_1}..."  |tee -a ${PKG_PATH}/${V_LOG}
echo ""

gen_log() {
    echo "$1" | tee -a ${PKG_PATH}/${V_LOG}
}

check_version() {
cur_version=`sqlplus -s ${user_name_1}/${password_1}${tnsname_1} << EOT
set feed off
set term off
set pages 0
set heading off
select version_code from EBAO_VERSION_INFO evi WHERE evi.latest_version = 'Y';
exit;
EOT`
cur_version=`echo ${cur_version:-NULL}|tr -d ["\r"]`

if [ ! "x${cur_version}" = "x${previous_version}" ]
 then
  return 1
 else
  return 0
fi
}

check_err() {
  log_file=`ls -t *.log|head -1`
  nError=`egrep -i '^DBERROR:|^ORA-|^SP2-|SP2-|^PLS-|^IMP-|^EBER-|"O/S Message:"' ${log_file} | wc -l`
  if [ ${nError} -ne '0' ]; then
    gen_log "EBER-005: $1 failed."
    gen_log "eBao system database was deployed with error, please check `pwd`/${log_file}."
    exit 1
  fi
}

check_err_imp() {
  log_file=`ls -t *.log|head -1`
  nError=`egrep -i '^DBERROR:|^ORA-|^SP2-|SP2-|^PLS-|^EBER-|"O/S Message:"' ${log_file} | wc -l`
  if [ ${nError} -ne '0' ]; then
    gen_log "EBER-006: $1 failed."
    gen_log "eBao system database was deployed with error, please check `pwd`/${log_file}."
    exit 1
  fi
}
 
check_error_context() {
    grep -ie ^ORA- -ie ^SP2- -ie ^IMP- -ie ^PLS- -ie "<error>" -ie "O/S Message:" $1 >>/dev/null 2>&1  
    if [ $? -eq 0 ]; then
	echo_failure  |tee -a ${PKG_PATH}/${V_LOG} 
	echo "EBER-008: dbscript or plsql deployed with error." >>  ${PKG_PATH}/${V_LOG}
    	echo ""
    	echo "---------------start of error context-------------------"
    	grep @ $1|tail -1
	for keyword in ^ORA-  ^SP2- ^IMP- ^PLS- "O\/S Message:" "<error>"
	do  
            for j in `sed -n "/$keyword/=" $1`   
            do 
                sed -n  $(($j-5)),$(($j+0))p $1 
            done
    	done
    	echo "---------------end of error context-------------------"
    	echo ""
	echo "Deployment failed, Please check log $1 for more details."
    	echo ""
	exit 1
    else
	echo_success |tee -a ${PKG_PATH}/${V_LOG} 
	echo ""
	[ `uname` = "AIX" ] || echo ""
    fi
}

deploy_dbscript() {
###############################upgrade_script function##################################
if [ -f dbscript/upgrade_script.sql ]
then 
export NLS_LANG=AMERICAN_AMERICA.UTF8
${ECHO} "Deploying dbscript ($NLS_LANG) ...\c"
cd dbscript
sqlplus  ${user_name_1}/${password_1}${tnsname_1} @upgrade_script.sql ${user_name_1}/${password_1}${tnsname_1} << EOF >> ${PKG_PATH}/${V_LOG} 2>&1 
/
quit
EOF
check_error_context ${PKG_PATH}/${V_LOG}
fi
}

deploy_plsql_utf8() {
###############################upgrade_plsql_utf8 function##################################
if [ -f plsql_utf8/upgrade_plsql.sql ]
then
export NLS_LANG=AMERICAN_AMERICA.UTF8
${ECHO} "Deploying utf8 plsql scripts ...\c"
cd plsql_utf8
sqlplus  ${user_name_1}/${password_1}${tnsname_1} @upgrade_plsql.sql << EOF >> ${PKG_PATH}/${V_LOG} 2>&1
/
quit
EOF
check_error_context ${PKG_PATH}/${V_LOG}
fi
}

deploy_plsql() {
###############################upgrade_plsql function##################################
if [ -f plsql/upgrade_plsql.sql ]
then 
export NLS_LANG=AMERICAN_AMERICA.ZHS16GBK

# check parameter utf8 or default zhs16bgk
test ! -z $lang && echo $lang | grep -qi utf8 && export NLS_LANG=AMERICAN_AMERICA.UTF8 

# convert GBK to UTF-8 for pck files
#find plsql -type f -name '*.pck'|while read i
#do
#        file "$i" |grep -qE '(8859|International)' && { cp "$i" "$i.bak"; iconv -f ISO_8859-1 -t UTF-8 "$i" > "$i.utf8"; cp "$i.utf8" "$i"; }
#done

${ECHO} "Deploying plsql scripts ($NLS_LANG)...\c"
cd plsql
sqlplus  ${user_name_1}/${password_1}${tnsname_1} @upgrade_plsql.sql << EOF >> ${PKG_PATH}/${V_LOG} 2>&1
/
quit
EOF
check_error_context ${PKG_PATH}/${V_LOG}
fi
}

deploy_pd() {
###############################upgrade product function#################################
if [ -d pd ]
then
export NLS_LANG=AMERICAN_AMERICA.UTF8
cd pd
echo "Start of product script deployment, which suppose to take long time, please be patient..."
for PKG_NAME in `ls *.zip 2>/dev/null `
do
  echo "======START of product ${PKG_NAME} deployment======"
  PDDT=`date +%Y%m%d_%H-%M-%S`
  unzip -d $PDDT ${PKG_NAME} >>${PKG_PATH}/${V_LOG} 2>&1	
  vResult=$?
  if [ ${vResult} -ne 0 ]
  then
    echo "  ERR: pd package file ${PKG_NAME} unzip failed"
    exit 1
  else
    echo "  ${PKG_NAME} unzip successfully!"
  fi
  cd $PDDT
sqlplus ${user_name_1}/${password_1}${tnsname_1} << EOT >>${PKG_PATH}/${V_LOG} 2>&1
set define off
@@upgrade_script.sql
quit
EOT

#check pd error
grep -ie ^ORA- -ie ^SP2- -ie ^IMP- -ie ^PLS- -ie "O/S Message:" upgrade_script_.log >>/dev/null 2>&1
if [ $? -eq 0 ]; then
  echo "  ${PKG_NAME} was deployed with error, please check log."
  echo "  Log file: `pwd`/upgrade_script_.log"
  check_error_context `pwd`/upgrade_script_.log
  vMark=1
  exit ${vMark}
else
  echo "  ${PKG_NAME} was deployed successfully!"
  echo "====== END of product ${PKG_NAME} deployment ======"
  vMark=0
fi
 
cd ..
done 
return ${vMark}
fi
}

deploy_demodata() {
export NLS_LANG=AMERICAN_AMERICA.UTF8
if [ -f demodata/upgrade_script.sql ]; then 
${ECHO} "Deploying Demodata ($NLS_LANG)...\c"
cd demodata 
sqlplus  ${user_name_1}/${password_1}${tnsname_1} << EOT >>${PKG_PATH}/${V_LOG} 2>&1
set define off
@@upgrade_script.sql
exit
EOT
check_error_context ${PKG_PATH}/${V_LOG}
fi
}

gen_log "Deployment work path: ${PKG_PATH} "
echo ""

cd ${PKG_PATH}
#check the current version of database.
if [ -f ${PKG_PATH}/version.properties ]; then
  . ${PKG_PATH}/version.properties
  check_version
  if [ $? -ne 0 ]
   then
        echo "The package version is ${current_version}."                                               |tee -a ${PKG_PATH}/${V_LOG}
        echo "The version check failed, please confirm."                                                |tee -a ${PKG_PATH}/${V_LOG}
        echo "The previous version is ${cur_version} in DB table EBAO_VERSION_INFO."                    |tee -a ${PKG_PATH}/${V_LOG}
        echo "The previous version is ${previous_version} in file version.properties."                  |tee -a ${PKG_PATH}/${V_LOG}
        echo ""
        exit 1
   else
        echo "The package version is ${current_version}."                                               |tee -a ${PKG_PATH}/${V_LOG}
        echo ""
  fi
fi

cd ${PKG_PATH}
deploy_dbscript
cd ${PKG_PATH}
deploy_plsql
cd ${PKG_PATH}
deploy_plsql_utf8
cd ${PKG_PATH}
deploy_pd
cd ${PKG_PATH}
deploy_demodata

###############################Deploy combined packages#############################
if [ -f ${PKG_PATH}/version_history ]; then
    for version in `cat version_history|grep -v ^#`
    do
      if [ -d  ${PKG_PATH}/$version/db ]; then
	cd ${PKG_PATH}/$version/db
	echo "--Start of Subpackage $version deployment..."
	echo ""
	deploy_dbscript
	cd ${PKG_PATH}/$version/db
	deploy_plsql
	cd ${PKG_PATH}/$version/db
	deploy_plsql_utf8
	cd ${PKG_PATH}/$version/db
	deploy_pd 
	cd ${PKG_PATH}/$version/db
	deploy_demodata
	cd ${PKG_PATH}
#	sed -i "s/^${version}/#${version}/g" version_history
        sed "s/^${version}/#${version}/g" version_history > version_history.tmp
        mv version_history.tmp version_history
	echo "--End of Subpackage $version deployment..."
	echo ""
      fi
    done
fi

###############################run grant privilege##################################
${ECHO} "Executing grant privilege procedure job...\c"

sqlplus  ${user_name_1}/${password_1}${tnsname_1} << EOT >>${PKG_PATH}/${V_LOG} 2>&1
declare
  job_id    number;
  jobNum number;
 jobwhat varchar2(200);
  CURSOR c_job IS
    select job
    from user_jobs a
    where upper(what) like 'P_GRANT_PRIVI%';
BEGIN

  OPEN c_job;
  LOOP
    FETCH c_job
      INTO job_id;
    EXIT WHEN c_job%NOTFOUND;
     jobwhat:='';
    select replace(replace(lower(what),';',''),'privi( ','privi(')
      into jobwhat
      from user_jobs a
     where job=job_id;
    --if no data
    if jobwhat is not null then
      execute immediate 'call '||jobwhat;
    end if;
  END LOOP;
  CLOSE c_job;
END;
/
exit
EOT
check_error_context ${PKG_PATH}/${V_LOG}

${ECHO} "Compiling invalid objects...\c"
###############################compile invalid objects################################
sqlplus -S ${user_name_1}/${password_1}${tnsname_1} << EOT >>${PKG_PATH}/${V_LOG} 2>&1
exec dbms_utility.compile_schema(schema => USER, compile_all => false);
exit
EOT

###############################check invalid objects##################################
sqlplus -S ${user_name_1}/${password_1}${tnsname_1} << EOT >>${PKG_PATH}/${V_LOG} 2>&1
set linesize 1000
column object_name format a30
column object_type format a15
set heading off
select 'INVALID_OBJECTS  ',a.object_name,a.object_type from user_objects a where  a.status='INVALID'
AND OBJECT_TYPE IN
(
'FUNCTION',
'PACKAGE',
'PACKAGE BODY',
'PROCEDURE',
'TRIGGER',
'VIEW'
);
exit
EOT
grep "no rows" ${PKG_PATH}/${V_LOG} >> /dev/null 2>&1
if [ $? -eq 0 ]; then
  check_error_context ${PKG_PATH}/${V_LOG}
else
  echo ""
  echo "-----------------------------------------"
  grep "INVALID_OBJECTS" ${PKG_PATH}/${V_LOG} |awk '{print $2,"\t", $3, $4}'
  if [ $? -eq 0 ]; then
    echo "-----------------------------------------"
    echo "EBER-007: WARNING: Invalid objects were found, please confirm." >> ${PKG_PATH}/${V_LOG}      
    echo "Warning! Invalid objects were found and details as below, please confirm." |tee -a ${PKG_PATH}/${V_LOG} 
  fi
fi
#sqlplus -S ${user_name_1}/${password_1}${tnsname_1} << EOT | tee -a ${PKG_PATH}/${V_LOG} 
sqlplus -S ${user_name_1}/${password_1}${tnsname_1} << EOT 
Set termout off
Set echo off
Set feedback off
Set serveroutput on
declare
TYPE type_1 IS REF CURSOR;
c1 type_1;
ls_sql varchar2(1000);
ls_type varchar2(30);
ln_line number;
ls_name varchar2(30);
ln_line_pre number;
ls_name_pre varchar2(30);
ls_text varchar2(3000);
begin
ls_sql:='select a.line,a.type,a.name,a.text from user_errors a where a.type<>''JAVA SOURCE'' order by name,type,line,sequence';
ls_name_pre:='';
ln_line_pre:=0;
OPEN c1 FOR ls_sql;
LOOP
		ls_text:='';
    ls_name:='';
    ln_line:=0;
    FETCH c1 INTO ln_line,ls_type,ls_name,ls_text;
    EXIT WHEN c1%NOTFOUND;
    if (ls_name_pre is null or ls_name_pre!=ls_name or ln_line_pre!=ln_line)
    then
        dbms_output.put_line('');
        dbms_output.put_line('Line '||to_char(ln_line)||' of <'||ls_type||'> <'||ls_name||'> has error:');
    end if;
    dbms_output.put_line(ls_text);
    ls_name_pre:=ls_name;
    ln_line_pre:=ln_line;
end loop;
close c1;
end;
/
exit
EOT

############################### OWB deployment ##################################
MDL_COUNT=`(find ${PKG_PATH} -name '*.mdl' ; find ${PKG_PATH} -name owb_drop_list.txt )|wc -l`
if [ $MDL_COUNT -gt 0 -a -f ${PKG_PATH}/owbscripts/initial_parameter.tcl ]; then
    ${ECHO} "Deploying OWB ...\c"
    cd $ORACLE_HOME/owb/bin/unix
    test -d ${PKG_PATH}/owbscripts/log || mkdir -p ${PKG_PATH}/owbscripts/log
    sh OMBPlus.sh ${PKG_PATH}/owbscripts/upgrade_owb.tcl ${PKG_PATH}
    owb_logfile=`ls -ltr $PKG_PATH/owbscripts/log/*/operation.log 2>/dev/null|tail -1|awk '{print $NF}'`
    test -z ${owb_logfile} || check_error_context ${owb_logfile}
fi

###############################error postchecking##################################
${ECHO} "Checking error of dbscript and plsql...\c"
export vMark=0
check_error_context ${PKG_PATH}/${V_LOG}
grep -ie ^ORA- -ie ^SP2- -ie ^IMP- -ie ^PLS- -ie "O/S Message:" ${PKG_PATH}/${V_LOG} >>/dev/null 2>&1
if [ $? -eq 0 ]; then
  echo "Dbscript or plsql was deployed with error, please check log for detailes."
  echo "Log file: ${PKG_PATH}/${V_LOG}"
  echo ""
  vMark=1
else
  echo "eBaoTech Insurance System DB Package was deployed successfully!"
  vMark=0
fi

echo ""
exit ${vMark} 
