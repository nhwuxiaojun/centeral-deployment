#!/usr/bin/sh
export JAVA_HOME="/opt/jdk1.6.0_35"
export PERL_CMD="/opt/ActivePerl-5.16/bin/perl"
export ENV_NAME=$1
export PKG_NAME=$2
export DEPLOYER=$4
export DEPLOY_CON=$5
export EMAIL=$6
export DT=`date +%Y%m%d_%H%M%S`
DEPLOY_TYPE="inc_deploy"
test -z $3 || export DEPLOY_TYPE=$3
[ -z $5 ] || [ "X$5" == "Xnull" ] && export DEPLOY_CON="all"
[ -z $6 ] || [ "X$6" == "Xnull" ] && export EMAIL="y"

KEY=~/.ssh/id_rsa
[ -f ~/.ssh/id_rsa ] || ssh-keygen <<EOF

EOF
PKG_PATH=$(cd "$(dirname "$0")"; pwd)
#echo ${PKG_PATH}

usage () {
	echo "Usage: $0 <env_name> <pkg_file_name> "; 
#	echo "Usage: $0 <env_name> <pkg_file_name> <inc_deploy|full_deploy|...> [<deployer>] [<all|app|db>] [<y|n>]"; 
	echo "<finished>"
	test -z ${ENV_NAME} ||  ${PERL_CMD} ${PKG_PATH}/update_deploy_log.pl $ENV_ID $LOG_ID failed
	exit 1; 
}

test -z ${ENV_NAME} && { echo "Please specify environment name."; usage; }

# Get environment information from TSOP 
${PERL_CMD} ${PKG_PATH}/get_env_info.pl ${ENV_NAME}

if [ ! -f ${PKG_PATH}/${ENV_NAME}/env_info.sh ]; then 
	echo "Environment ${ENV_NAME} was not found in TSOP, please confirm.";
	usage;
fi

cd ${PKG_PATH}/${ENV_NAME}
. ./env_info.sh

# Insert deployment record into TSOP
#${PERL_CMD} ${PKG_PATH}/insert_deploy_log.pl $ENV_ID $PKG_NAME $LOG_ID $4 "/usr/local/deploy/$ENV_NAME/$DT"

LOGFILE=${PKG_PATH}/logs/${ENV_NAME}_${PKG_NAME}.log

MAILFROM="${TS}@ebaotech.com"
test -z $4 || MAILFROM="${4}@ebaotech.com"
test -z $DM && DM="no-dm"
test -z $CM && CM="no-cm"
MAILIST="${TS}@ebaotech.com,`echo $DM|sed s#,#@ebaotech.com,#g`@ebaotech.com,`echo $CM|sed s#,#@ebaotech.com,#g`@ebaotech.com"
test -z $4 || MAILIST="${4}@ebaotech.com,${MAILIST}"
[ ${PKG_NAME} = "Testing_Empty_PKG.zip" ] && MAILIST="jiangtao.chen@ebaotech.com"


echo "****************************************************************" |tee -a  $LOGFILE
echo "                  Terminate Deployment Summary"				|tee -a  $LOGFILE
echo "****************************************************************" |tee -a  $LOGFILE
echo " Environment Name: ${ENV_NAME} - ${HOST}                        "	|tee -a  $LOGFILE
echo " Package Name: ${PKG_NAME}  [`ls -l ${PKG_PATH}/${ENV_NAME}/${DT}/${PKG_NAME} |awk '{print $5}'` bytes]                                 "	|tee -a  $LOGFILE
echo " Deployment Type: ${DEPLOY_TYPE} - ${DEPLOY_CON}                "	|tee -a  $LOGFILE
echo " Deployment Start Time: `date "+%F %T"`                         "	|tee -a  $LOGFILE
echo " Deployment By: ${DEPLOYER}                                     "	|tee -a  $LOGFILE
echo "****************************************************************" |tee -a  $LOGFILE
echo "" |tee -a  $LOGFILE

touch $LOGFILE

ps x|grep unzip|grep $PKG_NAME|grep -v grep|awk '{print $1}'|xargs kill -9 |tee -a  $LOGFILE

echo "Start Terminate DB Process"
DBPID1=`ps x|grep upgrade|grep $DBPASS|grep -v grep|awk '{print $1}'`
echo "kill DB Process ${DBPID1}" >> $LOGFILE
test -z $DBPID1 || kill -9 $DBPID1
sleep 5
DBPID2=`ps x|grep upgrade|grep $DBPASS|grep -v grep|awk '{print $1}'`
echo "kill DB Process ${DBPID2}" >> $LOGFILE
test -z $DBPID2 || kill -9 $DBPID2
echo "Terminate DB Deployment Successfully" >> $LOGFILE

echo "Start Terminate APP Process" >> $LOGFILE

ps x|grep ssh|grep ${LOGID}|grep -v grep|awk '{print $1}'|xargs kill -9 |tee -a  $LOGFILE
ps x|grep scp|grep ${LOGID}|grep -v grep|awk '{print $1}'|xargs kill -9 |tee -a  $LOGFILE

ssh -i $KEY ${LOGID}@${HOST} "ps x|grep bash_profile|grep -v grep|awk '{print \$1}'|xargs kill -9" |tee -a  $LOGFILE
ssh -i $KEY ${LOGID}@${HOST} "ps x|grep install.sh|grep -v grep|awk '{print \$1}'|xargs kill -9" |tee -a  $LOGFILE
ssh -i $KEY ${LOGID}@${HOST} "ps x|grep upgrade_life_app|grep -v grep|awk '{print \$1}'|xargs kill -9" |tee -a  $LOGFILE
sleep 15
ssh -i $KEY ${LOGID}@${HOST} "ps x|grep bash_profile|grep -v grep|awk '{print \$1}'|xargs kill -9" |tee -a  $LOGFILE
ssh -i $KEY ${LOGID}@${HOST} "ps x|grep install.sh|grep -v grep|awk '{print \$1}'|xargs kill -9" |tee -a  $LOGFILE
ssh -i $KEY ${LOGID}@${HOST} "ps x|grep upgrade_life_app|grep -v grep|awk '{print \$1}'|xargs kill -9" |tee -a  $LOGFILE

echo "Terminate APP Deployment Successfully" >> $LOGFILE
echo "***********************finished**************************" >> $LOGFILE
echo ""  >> $LOGFILE
echo "*******************************************************" 		>> $LOGFILE
echo "This email was generated and sent automatically." 		>> $LOGFILE
echo "If you don't want to receive it anymore, please contact TS team." >> $LOGFILE
echo "Sorry for any inconvenience caused!                             " >> $LOGFILE
echo "                           -- TS Team < EAS-TS@ebaotech.com >     " >> $LOGFILE
echo "*******************************************************" >> $LOGFILE

if [ "y" = "$EMAIL" ]; then 
# check send mail
# wget ftp://ftp.univie.ac.at/systems/linux/dag/redhat/el5/en/x86_64/dag/RPMS/email-3.1.2-2.el5.rf.x86_64.rpm
  /usr/bin/unix2dos $LOGFILE
#  zip ${DT}_db_log.zip $LOGFILE `find ${DT} -mtime -1 -name 'upgrade*.log'`
cat $LOGFILE | email -n $MAILFROM -f $MAILFROM -s "[Aborted] Terminate ${PKG_NAME} to ${PROJNAME} Successfully!" $MAILIST 
${PERL_CMD} ${PKG_PATH}/update_deploy_log.pl $ENV_ID $LOG_ID Aborted
${PERL_CMD} ${PKG_PATH}/reset_deploy_log.pl


exit 0
