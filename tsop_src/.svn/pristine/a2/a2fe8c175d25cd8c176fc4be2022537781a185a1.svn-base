#!/usr/bin/sh
export JAVA_HOME="/opt/jdk1.6.0_35"
export PERL_CMD="/opt/ActivePerl-5.16/bin/perl"
export ENV_NAME=$1
export PKG_NAME=$2
export DEPLOYER=$4
export DEPLOY_CON=$5
export EMAIL=$6
export AUTO_TEST=$7
export DT=`date +%Y%m%d_%H%M%S`
DEPLOY_TYPE="inc_deploy"
[ "X$4" == "Xall" ] && exit 1
test -z $3 || export DEPLOY_TYPE=$3
[ -z $5 ] || [ "X$5" == "Xnull" ] && DEPLOY_CON="all"
[ -z $6 ] || [ "X$6" == "Xnull" ] && EMAIL="y"
[ -z $6 ] || [ "X$7" == "Xnull" ] && AUTO_TEST="y"

KEY=~/.ssh/id_rsa
[ -f ~/.ssh/id_rsa ] || ssh-keygen <<EOF

EOF
PKG_PATH=$(cd "$(dirname "$0")"; pwd)
#echo ${PKG_PATH}

usage () {
	echo "Usage: $0 <env_name> <pkg_file_name> <inc_deploy|full_deploy|...> [<deployer>] [<all|app|db>] [email<y|n>] [test<y|n>]"; 
	echo "<finished>"
	test -z ${ENV_NAME} ||  ${PERL_CMD} ${PKG_PATH}/update_deploy_log.pl $ENV_ID $LOG_ID failed
	exit 1; 
}

test -z ${ENV_NAME} && { echo "Please specify environment name."; usage; }
test -z ${PKG_NAME} && { echo "please specify package file."; usage; }
test -d ${PKG_PATH}/${ENV_NAME} || { mkdir ${ENV_NAME}; }
chmod 775 ${PKG_PATH}/${ENV_NAME}
test -f ${ENV_NAME}/${PKG_NAME} || { echo "Package file ${PKG_NAME} was not found, please confirm"; usage; }
test -z ${DEPLOY_TYPE} && { echo "please specify deployment type."; usage; }

# Get environment information from TSOP 
${PERL_CMD} ${PKG_PATH}/get_env_info.pl ${ENV_NAME} || ${PERL_CMD} ${PKG_PATH}/get_db_info.pl ${ENV_NAME}
if [ $? -eq 1 ]; then
	${PERL_CMD} ${PKG_PATH}/get_db_env_info.pl ${ENV_NAME}
fi

if [ ! -f ${PKG_PATH}/${ENV_NAME}/env_info.sh ]; then 
	echo "Environment ${ENV_NAME} was not found in TSOP, please confirm.";
	usage;
fi

cd ${PKG_PATH}/${ENV_NAME}
. ./env_info.sh

# choose different oracle client for different project, default using client 11.2.0.4
export ORACLE_BASE=/opt/oracle3
if [ "x11.2.0.3" == "x${DB_VERSION}" ]; then
	export ORACLE_HOME=$ORACLE_BASE/product/11.2.0.3/client_1
	export PATH=$ORACLE_HOME/bin:$PATH
elif [ "x11.2.0.1" == "x${DB_VERSION}" ]; then
	export ORACLE_HOME=$ORACLE_BASE/product/11.2.0/client_1
	export PATH=$ORACLE_HOME/bin:$PATH
else
	export ORACLE_HOME=$ORACLE_BASE/product/11.2.0/client_3
	export PATH=$ORACLE_HOME/bin:$PATH
fi

# Insert deployment record into TSOP
${PERL_CMD} ${PKG_PATH}/insert_deploy_log.pl $ENV_ID $PKG_NAME $LOG_ID $4 "/usr/local/deploy/$ENV_NAME/$DT"
${PERL_CMD} ${PKG_PATH}/insert_db_deploy_log.pl $ENV_ID $PKG_NAME $LOG_ID $4 "/usr/local/deploy/$ENV_NAME/$DT"

LOGFILE=${PKG_PATH}/${PROJNAME}/deploy_log_$DT.log
LOGFILE2=${PKG_PATH}/logs/${ENV_NAME}_${PKG_NAME}.log
sed -i '/finished/d' $LOGFILE2
# wget ftp://ftp.univie.ac.at/systems/linux/fedora/epel/5/x86_64/sshpass-1.05-1.el5.x86_64.rpm
#mkdir $DT  && unzip -q -o -d $DT ../$PKG_NAME && mv ../$PKG_NAME $DT
chmod 775 ${PKG_PATH}/${PROJNAME}/$PKG_NAME
mkdir $DT  && unzip -q -o -d $DT $PKG_NAME && mv $PKG_NAME $DT && chmod 755 $DT/$PKG_NAME

MAILFROM="${TS}@ebaotech.com"
#[ $4 == "all" ] && { echo "all is not allowed for email sender" ; exit 1; }
test -z $4 || MAILFROM="${4}@ebaotech.com"
test -z $DM && DM="no-dm"
test -z $CM && CM="no-cm"
MAILIST="${TS}@ebaotech.com,`echo $DM|sed s#,#@ebaotech.com,#g`@ebaotech.com,`echo $CM|sed s#,#@ebaotech.com,#g`@ebaotech.com"
test -z $4 || MAILIST="${4}@ebaotech.com,${MAILIST}"
[ ${PKG_NAME} = "Testing_Empty_PKG.zip" ] && MAILIST="jiangtao.chen@ebaotech.com"

#ls -l ${DT}/${PKG_NAME} |awk '{print $5}' 				|tee -a $LOGFILE2|tee -a  $LOGFILE

echo "****************************************************************" |tee -a $LOGFILE2|tee -a  $LOGFILE
echo "                  Deployment Summary"				|tee -a $LOGFILE2|tee -a  $LOGFILE
echo "****************************************************************" |tee -a $LOGFILE2|tee -a  $LOGFILE
echo " Environment Name: ${ENV_NAME} - ${HOST}                        "	|tee -a $LOGFILE2|tee -a  $LOGFILE
echo " Package Name: ${PKG_NAME}  [`ls -l ${PKG_PATH}/${ENV_NAME}/${DT}/${PKG_NAME} |awk '{print $5}'` bytes]                                 "	|tee -a $LOGFILE2|tee -a  $LOGFILE
echo " Deployment Type: ${DEPLOY_TYPE} - ${DEPLOY_CON}                "	|tee -a $LOGFILE2|tee -a  $LOGFILE
echo " Deployment Start Time: `date "+%F %T"`                         "	|tee -a $LOGFILE2|tee -a  $LOGFILE
echo " Deployment By: ${DEPLOYER}                                     "	|tee -a $LOGFILE2|tee -a  $LOGFILE
#echo ${ENV_NAME} ${PKG_NAME} $DEPLOY_TYPE $DEPLOY_CON 			| tee -a $LOGFILE2|tee -a  $LOGFILE
echo "****************************************************************" |tee -a $LOGFILE2|tee -a  $LOGFILE
echo "" |tee -a $LOGFILE2|tee -a  $LOGFILE

touch $LOGFILE

cd ${PKG_PATH}/${ENV_NAME}
if [ -d $DT ]
then

# check db version info
echo "${DB_TYPE} ${DB_VERSION}: ${ORACLE_HOME}" |tee -a $LOGFILE2|tee -a  $LOGFILE

# Letter Deployment
if [ "all" = $DEPLOY_CON ] || [ "print" = $DEPLOY_CON ]
then
ls $DT/$PKG_NAME |grep -iE Letter
  if [ $? -eq 0 ]; then
    cd ${PKG_PATH}/${ENV_NAME}/${DT}
    /usr/local/deploy/copy_letter.sh ${PRINT_IP} ${PRINT_USER} ${PRINT_PWD} ${PKG_PATH}/${ENV_NAME}/${DT} ${LOGID}/Template ${PKG_NAME} | tee -a $LOGFILE2|tee -a  $LOGFILE &&
    /usr/local/deploy/unzip_letter.exp ${PRINT_IP} ${PRINT_USER} ${PRINT_PWD} "${PRINT_PATH}\Template" ${PKG_NAME} | tee -a $LOGFILE2|tee -a  $LOGFILE
    /usr/local/deploy/rm_letter.exp ${PRINT_IP} ${PRINT_USER} ${PRINT_PWD} "${PRINT_PATH}\Template" ${PKG_NAME} | tee -a $LOGFILE2|tee -a  $LOGFILE
    echo "--------------------Deploy letter package successful-------------------------------------" | tee -a $LOGFILE2|tee -a  $LOGFILE
    echo "<finished>" | tee -a $LOGFILE2|tee -a  $LOGFILE
  fi
fi

# Old V2 db deployment
if [ -f ${PKG_PATH}/${ENV_NAME}/$DT/upgrade_life_db.sh -a "all" = $DEPLOY_CON ] || [ -f ${PKG_PATH}/${ENV_NAME}/$DT/upgrade_life_db.sh -a "db" = $DEPLOY_CON ]
then
  echo -n "Killing db sessions..." 	|tee -a $LOGFILE2|tee -a  $LOGFILE
  sh /usr/local/deploy/kill_db_env_session.sh >/dev/null 2>&1
  echo "Done" |tee -a $LOGFILE2|tee -a  $LOGFILE
  cd ${PKG_PATH}/${ENV_NAME}/${DT}
  sed -i 's/^BOOTUP/#BOOTUP/g' *.sh
  echo "Old V2 db deployment ... "
  echo "--------------Start of script upgrade_db.sh output-----------------------------" |tee -a $LOGFILE2|tee -a  $LOGFILE
  echo "[CMD] sh upgrade_life_db.sh $DBUSER $DBPASS $DBLDAP" 	|tee -a $LOGFILE2|tee -a  $LOGFILE
  sh upgrade_life_db.sh $DBUSER $DBPASS $DBLDAP 		|tee -a $LOGFILE2|tee -a  $LOGFILE
  echo "--------------End of script upgrade_db.sh output-----------------------------" |tee -a $LOGFILE2|tee -a  $LOGFILE
fi 

# Old V2 db deployment
if [ -f ${PKG_PATH}/${ENV_NAME}/$DT/upgrade_db.sh -a "all" = $DEPLOY_CON ] || [ -f ${PKG_PATH}/${ENV_NAME}/$DT/upgrade_db.sh -a "db" = $DEPLOY_CON ]
then
  # Kill all db session before deployment
  echo -n "Killing db sessions..." 	|tee -a $LOGFILE2|tee -a  $LOGFILE
  sh /usr/local/deploy/kill_db_env_session.sh >/dev/null 2>&1
  echo "Done" |tee -a $LOGFILE2|tee -a  $LOGFILE

  cd ${PKG_PATH}/${ENV_NAME}/${DT}
  sed -i 's/^BOOTUP/#BOOTUP/g' *.sh
  echo "Old V2 db deployment ... "
  echo "--------------Start of script upgrade_db.sh output-----------------------------" |tee -a $LOGFILE2|tee -a  $LOGFILE
  echo "[CMD] sh upgrade_db.sh $DBUSER $DBPASS @$DBLDAP" 			|tee -a $LOGFILE2|tee -a  $LOGFILE
  sh upgrade_db.sh $DBUSER $DBPASS @$DBLDAP 					|tee -a $LOGFILE2|tee -a  $LOGFILE
  echo "-------------- End of script upgrade_db.sh output-----------------------------" |tee -a $LOGFILE2|tee -a  $LOGFILE
fi 

if [ -f ${PKG_PATH}/${ENV_NAME}/$DT/upgrade_life_app.sh -a "all" = $DEPLOY_CON ] || [ -f ${PKG_PATH}/${ENV_NAME}/$DT/upgrade_life_app.sh -a "app" = $DEPLOY_CON ]
then
  cd ${PKG_PATH}/${ENV_NAME}/${DT}
  echo "Old V2 app deployment ... "
fi 

# for Fica DB deployment DBUpgrade
if [ -f ${PKG_PATH}/${ENV_NAME}/$DT/DBUpgrade/upgrade_db.sh -a "all" = $DEPLOY_CON ] || [ -f ${PKG_PATH}/${ENV_NAME}/$DT/DBUpgrade/upgrade_db.sh -a "db" = $DEPLOY_CON ] 
then
  echo -n "Killing db sessions..." 	|tee -a $LOGFILE2|tee -a  $LOGFILE
  sh /usr/local/deploy/kill_db_env_session.sh >/dev/null 2>&1
  echo "Done" |tee -a $LOGFILE2|tee -a  $LOGFILE
  cd ${PKG_PATH}/${ENV_NAME}/$DT/DBUpgrade
  echo "--------------Start of script upgrade_db.sh output-----------------------------" |tee -a $LOGFILE2|tee -a  $LOGFILE
  sed -i 's/^BOOTUP/#BOOTUP/g' upgrade_db.sh
  echo "[CMD] sh upgrade_db.sh $DBUSER $DBPASS @$DBLDAP" |tee -a $LOGFILE2|tee -a  $LOGFILE
  sh upgrade_db.sh $DBUSER $DBPASS @$DBLDAP |tee -a $LOGFILE2|tee -a  $LOGFILE
  echo "-------------- End of script upgrade_db.sh output-----------------------------" |tee -a $LOGFILE2|tee -a  $LOGFILE
fi


# Maven db deployment
if [ -f ${PKG_PATH}/${ENV_NAME}/$DT/db/upgrade-db.xml -a "all" = $DEPLOY_CON ] || [ -f ${PKG_PATH}/${ENV_NAME}/$DT/db/upgrade-db.xml -a "db" = $DEPLOY_CON ]
then
  echo -n "Killing db sessions..." 	|tee -a $LOGFILE2|tee -a  $LOGFILE
  sh /usr/local/deploy/kill_db_env_session.sh >/dev/null 2>&1
  echo "Done" |tee -a $LOGFILE2|tee -a  $LOGFILE
  echo "Deploying package ${PKG_NAME} to DB Server (Maven) ..." | tee -a $LOGFILE2|tee -a  $LOGFILE
  cd ${PKG_PATH}/${ENV_NAME}/$DT/db
  echo "-------------- Start of script upgrade_db.sh output-----------------------------" |tee -a $LOGFILE2|tee -a  $LOGFILE
  if [ "xMySQL" == "x${DB_TYPE}" ]; then
    echo "[CMD] sh upgrade_db.sh $DBUSER $DBPASS jdbc:mysql://${DBIP}:${DBPORT}/${DBUSER}_db"   |tee -a $LOGFILE2|tee -a  $LOGFILE
    sh upgrade_db.sh $DBUSER $DBPASS jdbc:mysql://${DBIP}:${DBPORT}/${DBUSER}_db        |tee -a $LOGFILE2|tee -a  $LOGFILE
  else
    echo "[CMD] sh upgrade_db.sh $DBUSER $DBPASS jdbc:oracle:thin:@${DBIP}:${DBPORT}:${DBSID}" |tee -a $LOGFILE2|tee -a  $LOGFILE
    sh upgrade_db.sh $DBUSER $DBPASS jdbc:oracle:thin:@${DBIP}:${DBPORT}:${DBSID} |tee -a $LOGFILE2|tee -a  $LOGFILE
  fi
  echo "-------------- End of script upgrade_db.sh output-----------------------------" |tee -a $LOGFILE2|tee -a  $LOGFILE
else
# db deployment
if [ -d ${PKG_PATH}/${ENV_NAME}/$DT/db -a "all" = $DEPLOY_CON ] || [ -d ${PKG_PATH}/${ENV_NAME}/$DT/db -a "db" = $DEPLOY_CON ]
then
  # Kill all db session before deployment
  echo -n "Killing db sessions..." 	|tee -a $LOGFILE2|tee -a  $LOGFILE
  sh /usr/local/deploy/kill_db_env_session.sh >/dev/null 2>&1
  echo "Done" |tee -a $LOGFILE2|tee -a  $LOGFILE
  echo "Deploying package ${PKG_NAME} to DB Server ..." | tee -a $LOGFILE2|tee -a  $LOGFILE
  cd ${PKG_PATH}/${ENV_NAME}/$DT/db
#svn --username "jiangtao.chen" export http://svnedge.ebaotech.com/svn/repos/deployment_scripts/milestone/db/upgrade_db.sh
if [ -f upgrade_db.sh ]; then
  # for OWB deployment
  if [ -d owbscripts ]; then
    cp -v ${PKG_PATH}/${ENV_NAME}/initial_parameter.tcl owbscripts/ 			|tee -a $LOGFILE2|tee -a  $LOGFILE
  fi
  echo "--------------Start of script upgrade_db.sh output-----------------------------" |tee -a $LOGFILE2|tee -a  $LOGFILE
  sed -i 's/^BOOTUP/#BOOTUP/g' upgrade_db.sh
  echo "[CMD] sh upgrade_db.sh $DBUSER $DBPASS @$DBLDAP" |tee -a $LOGFILE2|tee -a  $LOGFILE
  sh upgrade_db.sh $DBUSER $DBPASS @$DBLDAP |tee -a $LOGFILE2|tee -a  $LOGFILE
  echo "-------------- End of script upgrade_db.sh output-----------------------------" |tee -a $LOGFILE2|tee -a  $LOGFILE
elif [ -f upgrade_db_all_chartis.sh ]; then
  echo "--------------Start of script upgrade_db.sh output-----------------------------" |tee -a $LOGFILE2|tee -a  $LOGFILE
  echo "Sorry, deployment script upgrade_db.sh was not found in package, please confirm~~~" |tee -a $LOGFILE2|tee -a  $LOGFILE
  sed -i 's/^BOOTUP/#BOOTUP/g' upgrade_db_all_chartis.sh
  echo "[CMD] sh upgrade_db_all_chartis.sh $DBUSER $DBPASS @$DBLDAP" |tee -a $LOGFILE2|tee -a  $LOGFILE
  sh upgrade_db_all_chartis.sh $DBUSER $DBPASS @$DBLDAP |tee -a $LOGFILE2|tee -a  $LOGFILE
  echo "-------------- End of script upgrade_db.sh output-----------------------------" |tee -a $LOGFILE2|tee -a  $LOGFILE
else
  echo "--------------Start of script upgrade_db.sh output-----------------------------" |tee -a $LOGFILE2|tee -a  $LOGFILE
  echo "[Failed] Sorry, deployment script upgrade_db.sh was not found in package, please check!" |tee -a $LOGFILE2|tee -a  $LOGFILE
  echo "-------------- End of script upgrade_db.sh output-----------------------------" |tee -a $LOGFILE2|tee -a  $LOGFILE
fi
fi # fi of db deployment
fi # fi of maven deployment

cd ${PKG_PATH}/${ENV_NAME}
# deploy app files
if [ -d ${PKG_PATH}/${ENV_NAME}/$DT/EAR_FILE -a "all" = $DEPLOY_CON ] || [ -d ${PKG_PATH}/${ENV_NAME}/$DT/EAR_FILE -a "app" = $DEPLOY_CON ] || [ -f ${PKG_PATH}/${ENV_NAME}/$DT/upgrade_life_app.sh -a "all" = $DEPLOY_CON ] || [ -f ${PKG_PATH}/${ENV_NAME}/$DT/upgrade_life_app.sh -a "app" = $DEPLOY_CON ] || [ -f $DT/upgrade_insurance_app.sh -a "all" = $DEPLOY_CON ] || [ -f $DT/upgrade_insurance_app.sh -a "app" = $DEPLOY_CON ] || [ -d ${DT}/BATCH -a "batch" = ${DEPLOY_CON} ] || [ -d ${DT}/BATCH -a "all" = ${DEPLOY_CON} ]
then
echo "Deploying package ${PKG_NAME} to App Server..." | tee -a $LOGFILE2|tee -a  $LOGFILE
which sshpass || { echo "SSHPASS was not installed, please install and retry"; usage; }
export SSHPASS=$LOGID
sed -i "/${HOST}/d" ~/.ssh/known_hosts 
export SSHOPTS="-o ConnectTimeout=30 -o StrictHostKeyChecking=no"

sshpass -e ssh $SSHOPTS ${LOGID}@${HOST} "test -d ~/.ssh || mkdir ~/.ssh ; chmod 700 ~/.ssh"
[ $? -ne 0 ] && { echo "Host ${HOST} unreachable or wrong password, please check" | tee -a $LOGFILE2|tee -a  $LOGFILE ; usage; }
sshpass -e ssh $SSHOPTS ${LOGID}@${HOST} "grep -q rhel4u3 ~/.ssh/authorized_keys || echo 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAnd+QY1i+4aXrbkOdXliT3VmmeEJk+FlbsHiQ825iSPksY3uTphYu0G9rIHlneqORoKVGYtd4iUhRCBEBs64uScd6yPKWqYSZDWBr4fZ5ZMafku5KYcwwUpICZQ902DNW9bFXaEWNc/g17wfk4PTaXTAqbItRrx9bOdqbs5yZzRE= root@rhel4u3.ebaotech.com' >> ~/.ssh/authorized_keys ; chmod 600 ~/.ssh/authorized_keys"
sshpass -e scp $SSHOPTS ~/.ssh/id_rsa.pub ${LOGID}@${HOST}:~/.ssh/
sshpass -e ssh $SSHOPTS ${LOGID}@${HOST} "grep -q tsop_deploy@localhost.localdomain ~/.ssh/authorized_keys || cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys ; chmod 600 ~/.ssh/authorized_keys"

date | tee -a $LOGFILE2|tee -a  $LOGFILE

#delete old package files
ssh -i $KEY ${LOGID}@${HOST} " find ${APP_PATH} -name 'heapdump*' -type f -mtime +1 -exec rm {} \; "			|tee -a $LOGFILE2|tee -a  $LOGFILE
ssh -i $KEY ${LOGID}@${HOST} " find ${PATCH_PATH} -name '*.zip' -type f -mtime +1 -exec rm {} \; "			|tee -a $LOGFILE2|tee -a  $LOGFILE
ssh -i $KEY ${LOGID}@${HOST} " find ${PATCH_PATH} -name '*.ear' -type f -mtime +1 -exec rm {} \; "			|tee -a $LOGFILE2|tee -a  $LOGFILE
ssh -i $KEY ${LOGID}@${HOST} " find ${PATCH_PATH} -name 'db' -type d -mtime +1 -exec rm -fr {} \; "			|tee -a $LOGFILE2|tee -a  $LOGFILE
ssh -i $KEY ${LOGID}@${HOST} " find ${PATCH_PATH} -name 'EBAO*'  -mtime +1 -exec rm -rf {} \; "			|tee -a $LOGFILE2|tee -a  $LOGFILE

#ckeck target app server status
ssh -i $KEY ${LOGID}@${HOST} "uptime "						|tee -a $LOGFILE2|tee -a  $LOGFILE
ssh -i $KEY ${LOGID}@${HOST} "grep Mem /proc/meminfo  "				|tee -a $LOGFILE2|tee -a  $LOGFILE
ssh -i $KEY ${LOGID}@${HOST} "vmstat 1 3 "					|tee -a $LOGFILE2|tee -a  $LOGFILE

#check variable APP_PATH existance
ssh -i $KEY ${LOGID}@${HOST} " test -d ${APP_PATH} || {  exit 1; } "
[ $? -eq 1 ] && { echo "Path $APP_PATH does NOT exist in app server, please confirm!"; \
echo "failed and finished"; ${PERL_CMD} ${PKG_PATH}/update_deploy_log.pl $ENV_ID $LOG_ID failed || \ 
${PERL_CMD} ${PKG_PATH}/update_db_deploy_log.pl $ENV_ID $LOG_ID failed; exit 1; }		  |tee -a $LOGFILE2|tee -a  $LOGFILE


#check disk space
ssh -i $KEY ${LOGID}@${HOST} "test -d ${APP_PATH} && df -P -h ${APP_PATH} || df -P -h / "				|tee -a $LOGFILE2|tee -a  $LOGFILE
#ls -l ${DT}/${PKG_NAME} |awk '{print $5}' 										|tee -a $LOGFILE2|tee -a  $LOGFILE

FILE_SIZE=`ls -l ${DT}/${PKG_NAME} |awk '{print $5}' `

DISK_SPACE=`ssh -i $KEY ${LOGID}@${HOST} " df -P  ${APP_PATH}|tail -1" |awk '{print $4}' `
echo "Available disk space: ${DISK_SPACE}" 	|tee -a $LOGFILE2|tee -a  $LOGFILE

[ $DISK_SPACE -gt `expr ${FILE_SIZE} \* 3 / 1024` -a $DISK_SPACE -gt 1024000 ] && echo "Disk space check passed. "	|tee -a $LOGFILE2|tee -a  $LOGFILE
[ $DISK_SPACE -lt `expr ${FILE_SIZE} \* 3 / 1024` -a $DISK_SPACE -lt 1024000 ] && { echo "Disk space check failed(<1GB), No enough disk space available, please get assistance from TS owner. "	|tee -a $LOGFILE2|tee -a  $LOGFILE ; usage; exit 1; }

# Shutdown Batch Server
#ssh -i $KEY ${LOGID}@${HOST} "pwd; find ${APP_PATH} -name 'batch_manage.sh' |while read i; do sh $i stop; done "
ssh -i $KEY ${LOGID}@${HOST} "ps -ef|grep java|grep Batch|grep -v grep|awk '{print \$2}'|xargs kill -9"

# Modify Websphere soap client timeout setting to unlimit
ssh -i $KEY ${LOGID}@${HOST} "cd ${APP_PATH}; grep =180$ properties/soap.client.props && sed -i 's/180/0/g' properties/soap.client.props && ( killall -9 java ; sh bin/startServer.sh server1 )" |tee -a $LOGFILE2|tee -a  $LOGFILE 
echo "Step 1) Patch uploading to ${LOGID}@${HOST}:${PATCH_PATH}..." 						| tee -a $LOGFILE2|tee -a  $LOGFILE					
ssh -i $KEY ${LOGID}@${HOST} mkdir -p ${PATCH_PATH}/$DT.$PKG_NAME						|tee -a $LOGFILE2|tee -a  $LOGFILE
scp -i $KEY ${DT}/${PKG_NAME} ${LOGID}@${HOST}:${PATCH_PATH}/$DT.${PKG_NAME}					|tee -a $LOGFILE2|tee -a  $LOGFILE

  echo "Step 2) Unzip package ${PATCH_PATH}..." 									|tee -a $LOGFILE2|tee -a  $LOGFILE
  date | tee -a $LOGFILE2|tee -a  $LOGFILE
  ssh -i $KEY ${LOGID}@${HOST} unzip -q -d ${PATCH_PATH}/$DT.${PKG_NAME} ${PATCH_PATH}/$DT.${PKG_NAME}/*.zip  		|tee -a $LOGFILE2|tee -a  $LOGFILE

# for FKK Batch deployment
if [ -d ${PKG_PATH}/${ENV_NAME}/$DT/BATCH -a "all" = $DEPLOY_CON ] || [ -d ${PKG_PATH}/${ENV_NAME}/$DT/BATCH -a "batch" = $DEPLOY_CON ]
then
  ssh -i $KEY ${LOGID}@${HOST} mv ${PATCH_PATH}/$DT.$PKG_NAME/*.zip ${APP_PATH}						|tee -a $LOGFILE2|tee -a  $LOGFILE
elif [ `echo ${PKG_NAME}|cut -c-6` == "FUKOKU" -a "all" = $DEPLOY_CON ] || [ `echo ${PKG_NAME}|cut -c-6` == "FUKOKU" -a "app" = $DEPLOY_CON ]
then
  ssh -i $KEY ${LOGID}@${HOST} mv ${PATCH_PATH}/$DT.$PKG_NAME/*.zip ${APP_PATH}/upload/auto_deploy			|tee -a $LOGFILE2|tee -a  $LOGFILE
else
  ssh -i $KEY ${LOGID}@${HOST} rm -v ${PATCH_PATH}/$DT.${PKG_NAME}/*.zip 						|tee -a $LOGFILE2|tee -a  $LOGFILE
fi

if [ -f ${PKG_PATH}/${ENV_NAME}/$DT/upgrade_life_app.sh -a "all" = $DEPLOY_CON ] || [ -f ${PKG_PATH}/${ENV_NAME}/$DT/upgrade_life_app.sh -a "app" = $DEPLOY_CON ]
then 
  echo "Step 4) Start deployment ..."
  echo "-------------Start of script upgrade_life_app.sh output-----------------------------" 				|tee -a $LOGFILE2|tee -a  $LOGFILE
  echo  "[CMD] . ~/.bash_profile ; cd ${PATCH_PATH}/$DT.${PKG_NAME}/; sh upgrade_life_app.sh $DEPLOY_TYPE " 			|tee -a $LOGFILE2|tee -a  $LOGFILE
  ssh -i $KEY ${LOGID}@${HOST} ". ~/.bash_profile ; cd ${PATCH_PATH}/$DT.${PKG_NAME} ; sh upgrade_life_app.sh $DEPLOY_TYPE" 	|tee -a $LOGFILE2|tee -a  $LOGFILE
  echo "-------------End of script upgrade_life.app.sh output-----------------------------" 				|tee -a $LOGFILE2|tee -a  $LOGFILE
# for axa deployment
elif [ -f ${PKG_PATH}/${ENV_NAME}/$DT/upgrade_insurance_app.sh -a "all" = $DEPLOY_CON ] || [ -f ${PKG_PATH}/${ENV_NAME}/$DT/upgrade_insurance_app.sh -a "app" = $DEPLOY_CON ]
then
  echo "Step 4) Start deployment ..."
  echo "-------------Start of script upgrade_life_app.sh output-----------------------------"                           |tee -a $LOGFILE2|tee -a  $LOGFILE
  echo  "[CMD] . ~/.bash_profile ; cd ${PATCH_PATH}/$DT.${PKG_NAME}/; sh upgrade_insurance_app.sh $DEPLOY_TYPE "                     |tee -a $LOGFILE2|tee -a  $LOGFILE
  ssh -i $KEY ${LOGID}@${HOST} ". ~/.bash_profile ; cd ${PATCH_PATH}/$DT.${PKG_NAME} ; sh upgrade_insurance_app.sh $DEPLOY_TYPE"     |tee -a $LOGFILE2|tee -a  $LOGFILE
  echo "-------------End of script upgrade_life.app.sh output-----------------------------"                             |tee -a $LOGFILE2|tee -a  $LOGFILE
# for FKK Batch deployment
elif [ -d ${PKG_PATH}/${ENV_NAME}/$DT/BATCH -a "all" = $DEPLOY_CON ] || [ -d ${PKG_PATH}/${ENV_NAME}/$DT/BATCH -a "batch" = $DEPLOY_CON ]
then
  echo "Step 4) Start FKK Batch deployment ..."
  echo ". ~/.bash_profile; cd ${APP_PATH}; sh auto_deploy_batch.sh `echo ${PKG_NAME} |awk -F.zip {'print \$1'}`"|tee -a $LOGFILE2|tee -a  $LOGFILE 
  ssh -i $KEY ${LOGID}@${HOST} ". ~/.bash_profile; cd ${APP_PATH}; sh auto_deploy_batch.sh `echo ${PKG_NAME} |awk -F.zip {'print \$1'}`"|tee -a $LOGFILE2|tee -a  $LOGFILE 
# for FKK app deployment
elif [ `echo ${PKG_NAME}|cut -c-6` == "FUKOKU" -a "all" = $DEPLOY_CON ] || [ `echo ${PKG_NAME}|cut -c-6` == "FUKOKU" -a "app" = $DEPLOY_CON ]
then
  echo "Step 4) Start FKK App deployment ..."
  echo ". ~/.bash_profile; cd ${APP_PATH}/upload/auto_deploy; sh auto_deploy_app.sh `echo ${PKG_NAME} |awk -F.zip {'print \$1'}` ${LOGID}"|tee -a $LOGFILE2|tee -a  $LOGFILE 
  ssh -i $KEY ${LOGID}@${HOST} ". ~/.bash_profile; cd ${APP_PATH}/upload/auto_deploy; sh auto_deploy_app.sh `echo ${PKG_NAME} |awk -F.zip {'print \$1'}` ${LOGID}"|tee -a $LOGFILE2|tee -a  $LOGFILE 
else
# Backup file.properties
#  ssh -i $KEY ${LOGID}@${HOST} "cp ${PATCH_PATH}/file.properties ${PATCH_PATH}/file.properties.${DT}.${DEPLOYER}" 	|tee -a $LOGFILE2|tee -a  $LOGFILE
# Upload file.properties to target environment
  ssh -i $KEY ${LOGID}@${HOST} "cp ${PATCH_PATH}/file.properties ${PATCH_PATH}/$DT.${PKG_NAME}/scripts" 		|tee -a $LOGFILE2|tee -a  $LOGFILE
  touch ${PKG_PATH}/${ENV_NAME}/file.properties
  row_num=0
  row_num=`wc -l ${PKG_PATH}/${ENV_NAME}/file.properties|awk '{print $1}'`
  echo $row_num   |tee -a $LOGFILE2|tee -a  $LOGFILE

# Download file.properties from target environment if not exist in local
  if [ $row_num -lt 5 ]; then
    echo "Downloading file.properties from remote environment ..." 						|tee -a $LOGFILE2|tee -a  $LOGFILE
    scp -i $KEY ${LOGID}@${HOST}:${PATCH_PATH}/file.properties ${PKG_PATH}/${ENV_NAME}/file.properties   |tee -a $LOGFILE2|tee -a  $LOGFILE
    scp -i $KEY ${LOGID}@${HOST}:${PATCH_PATH}/build.properties ${PKG_PATH}/${ENV_NAME}/file.properties   |tee -a $LOGFILE2|tee -a  $LOGFILE
  fi 

  echo "Step 3) Uploading file.properties to remote environment..." 						|tee -a $LOGFILE2|tee -a  $LOGFILE
  if [ $row_num -gt 5 ]; then
# dos2unix doesn't work for unknow reasons
    /usr/bin/dos2unix ${PKG_PATH}/${ENV_NAME}/file.properties										>> $LOGFILE 2>&1
    scp -i $KEY ${PKG_PATH}/${ENV_NAME}/file.properties ${LOGID}@${HOST}:${PATCH_PATH}/$DT.${PKG_NAME}/scripts/file.properties	|tee -a $LOGFILE2|tee -a  $LOGFILE
    scp -i $KEY ${PKG_PATH}/${ENV_NAME}/file.properties ${LOGID}@${HOST}:${PATCH_PATH}/$DT.${PKG_NAME}/scripts/build.properties	|tee -a $LOGFILE2|tee -a  $LOGFILE
  fi
  ssh -i $KEY ${LOGID}@${HOST} "dos2unix ${PATCH_PATH}/file.properties " 					|tee -a $LOGFILE2|tee -a  $LOGFILE
#  ssh -i $KEY ${LOGID}@${HOST} "cp ${PATCH_PATH}/build.properties ${PATCH_PATH}/$DT.${PKG_NAME}/scripts" 	|tee -a $LOGFILE2|tee -a  $LOGFILE

  echo "Step 4) Start deployment ${PATCH_PATH}..." 								|tee -a $LOGFILE2|tee -a  $LOGFILE
  echo "-------------Start of script install.sh output-----------------------------" 				|tee -a $LOGFILE2|tee -a  $LOGFILE
#  echo  "cd ${PATCH_PATH}/$DT.${PKG_NAME}/scripts; sh install.sh $DEPLOY_TYPE " 				|tee -a $LOGFILE2|tee -a  $LOGFILE
#  ssh -i $KEY ${LOGID}@${HOST} "mv ${APP_PATH}/restart.sh ${APP_PATH}/restart.sh.disable  "			 		|tee -a $LOGFILE2|tee -a  $LOGFILE
if [ ${DEPLOYER} = "yue.wang" ]; then
  ssh -i $KEY ${LOGID}@${HOST} ". ~/.bash_profile ; cd ${PATCH_PATH}/$DT.${PKG_NAME}/scripts; sh -x install.sh $DEPLOY_TYPE " 	|tee -a $LOGFILE2|tee -a  $LOGFILE
else
  ssh -i $KEY ${LOGID}@${HOST} ". ~/.bash_profile ; cd ${PATCH_PATH}/$DT.${PKG_NAME}/scripts; sh install.sh $DEPLOY_TYPE " 	|tee -a $LOGFILE2|tee -a  $LOGFILE
fi
#  ssh -i $KEY ${LOGID}@${HOST} "mv ${APP_PATH}/restart.sh.disable ${APP_PATH}/restart.sh  " 					|tee -a $LOGFILE2|tee -a  $LOGFILE
  echo "------------- End of script install.sh output -----------------------------" 				|tee -a $LOGFILE2|tee -a  $LOGFILE
# After deployment, start batch
#  echo "Step 5) Start Batch Server ..."
#  ssh -i $KEY ${LOGID}@${HOST} ". ~/.bash_profile; find ${APP_PATH}/EBAO_HOME -name 'batch_manage.sh' |while read i; do sh \$i restart; done " |tee -a $LOGFILE2|tee -a  $LOGFILE
fi

  echo "Step 5) Downloading deployment log files ..." 									|tee -a $LOGFILE2|tee -a  $LOGFILE
  scp -i $KEY ${LOGID}@${HOST}  ${LOGID}@${HOST}:${PATCH_PATH}/$DT.${PKG_NAME}/scripts/instal*.log upgrade.log

  date  | tee -a $LOGFILE2|tee -a  $LOGFILE

# Trigger ST auto testing script
grep ${ENV_NAME} /usr/local/deploy/test_server_list.txt |grep -v ^#
if [ $? -eq 0 ]; then
#  eval $(grep ${ENV_NAME}  /usr/local/deploy/test_server_list.txt|awk '{print "ENV_NAME="$1";TIP="$2";TUSER="$3";TPWD="$4}') 
grep ${ENV_NAME}  /usr/local/deploy/test_server_list.txt|while read line
do
  eval $(echo $line|awk '{print "ENV_NAME="$1";TIP="$2";TUSER="$3";TPWD="$4}') 
  if [ "xy" = "x$AUTO_TEST" ]; then
    echo "Start executing auto-test scripts..."
   echo "IP=${TIP},ENV_NAME=${ENV_NAME},USER=${TUSER},PWD=${TPWD}"   | tee -a $LOGFILE2|tee -a  $LOGFILE
    echo "Start executing ST auto-test scripts..." | tee -a $LOGFILE2|tee -a  $LOGFILE
    #/usr/local/deploy/trigger_auto_test.exp 172.30.2.130 "ebaotech\frank.lin" 1234Asdf "E:\\TS_Automation\\${ENV_NAME}" "auto.bat"
    #rdesktop 172.30.6.56 -u Automationtester -d ebaotech -p D35Xrgbt -A -s "auto.bat" -c "E:\\TS_Automation\\AIG_BR_AMS_PD_GS\\"
    # trigger auto test script after 5 minitues
    /usr/local/deploy/trigger_auto_test.exp ${TIP} ${TUSER} ${TPWD} "E:\\TS_Automation\\${ENV_NAME}\\auto.bat" `date +%m/%d/%Y` `date +%H:%M --date=@$(($(date +%s)+5*60))` | tee -a $LOGFILE2|tee -a  $LOGFILE
    #nohup rdesktop ${TIP} -u ${TUSER} -p ${TPWD} -A -s "auto.bat" -c "E:\\TS_Automation\\${ENV_NAME}\\"  &
    #sleep 5
    #pkill -9 rdesktop
    echo "Done" | tee -a $LOGFILE2|tee -a  $LOGFILE
  fi
done #while
fi

fi

echo "TSOP Deployment finished!" | tee -a $LOGFILE2|tee -a  $LOGFILE

echo "" >> $LOGFILE
echo "*******************************************************" 		>> $LOGFILE
echo "This email was generated and sent automatically." 		>> $LOGFILE
echo "If you don't want to receive it anymore, please contact TS team." >> $LOGFILE
echo "Sorry for any inconvenience caused!                             " >> $LOGFILE
echo "                           -- TS Team < EAS-TS@ebaotech.com >     " >> $LOGFILE
echo "*******************************************************" >> $LOGFILE

#if [ "build_admin" = "${4}" -o "jackie.xiao" = "${4}" -o "kai.qian" = "${4}" ]; then
#        cat $LOGFILE | email -n $MAILFROM -f $MAILFROM -s "[Debug] Deploy ${PKG_NAME} to ${PROJNAME} !" jiangtao.chen@ebaotech.com
#	cat $LOGFILE >> ${PKG_PATH}/logs/${ENV_NAME}_${PKG_NAME}.log
#fi

if [ "y" = "$EMAIL" ]; then 
# check send mail
# wget ftp://ftp.univie.ac.at/systems/linux/dag/redhat/el5/en/x86_64/dag/RPMS/email-3.1.2-2.el5.rf.x86_64.rpm
  /usr/bin/unix2dos $LOGFILE
#  zip ${DT}_db_log.zip $LOGFILE `find ${DT} -mtime -1 -name 'upgrade*.log'`
  grep -iE "(Fail!|failed|usage)" $LOGFILE|grep -v -i continue
  if [ $? -eq 0 ]; then 
        cat $LOGFILE | email -high-priority -n $MAILFROM -f $MAILFROM -s "[TSOP] [Failed] Deploy ${PKG_NAME} to ${PROJNAME} failed!" $MAILIST
	${PERL_CMD} ${PKG_PATH}/update_deploy_log.pl $ENV_ID $LOG_ID failed
	${PERL_CMD} ${PKG_PATH}/update_db_deploy_log.pl $ENV_ID $LOG_ID failed
  else 
    grep -iE "(Warning!|warn|warning)" $LOGFILE
    if [ $? -eq 0 ]; then
    	cat $LOGFILE | email -n $MAILFROM -f $MAILFROM -s "[TSOP] [WARNING] Deploy ${PKG_NAME} to ${PROJNAME} with warning!" $MAILIST 
    	${PERL_CMD} ${PKG_PATH}/update_deploy_log.pl $ENV_ID $LOG_ID warning
    	${PERL_CMD} ${PKG_PATH}/update_db_deploy_log.pl $ENV_ID $LOG_ID warning
    else 
        cat $LOGFILE | email -n $MAILFROM -f $MAILFROM -s "[TSOP] [Succeed] Deploy ${PKG_NAME} to ${PROJNAME} succeed!" $MAILIST
	${PERL_CMD} ${PKG_PATH}/update_deploy_log.pl $ENV_ID $LOG_ID succeed
	${PERL_CMD} ${PKG_PATH}/update_db_deploy_log.pl $ENV_ID $LOG_ID succeed
    fi
  fi
else
  grep -iE "(Fail!|failed|usage)" $LOGFILE|grep -v -i continue
  if [ $? -eq 0 ]; then
        ${PERL_CMD} ${PKG_PATH}/update_deploy_log.pl $ENV_ID $LOG_ID failed
        ${PERL_CMD} ${PKG_PATH}/update_db_deploy_log.pl $ENV_ID $LOG_ID failed
  else
    grep "Warning!" $LOGFILE
    if [ $? -eq 0 ]; then
        ${PERL_CMD} ${PKG_PATH}/update_deploy_log.pl $ENV_ID $LOG_ID warning
        ${PERL_CMD} ${PKG_PATH}/update_db_deploy_log.pl $ENV_ID $LOG_ID warning
    else
        ${PERL_CMD} ${PKG_PATH}/update_deploy_log.pl $ENV_ID $LOG_ID succeed
        ${PERL_CMD} ${PKG_PATH}/update_db_deploy_log.pl $ENV_ID $LOG_ID succeed
    fi
  fi
fi 

else
  echo "Patch file was not found."
  ${PERL_CMD} ${PKG_PATH}/update_deploy_log.pl $ENV_ID $LOG_ID abnormal
  ${PERL_CMD} ${PKG_PATH}/update_db_deploy_log.pl $ENV_ID $LOG_ID abnormal
fi

exit 0
