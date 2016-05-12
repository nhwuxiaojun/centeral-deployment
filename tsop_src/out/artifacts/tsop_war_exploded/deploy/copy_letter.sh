usage() {
echo "======================================================================="
echo "Usage: sh $0 <PRINT_IP> <USERNAME> <PASSWORD> <LOCALPATH> <REMOTEPATH> <FILENAME>"
echo "======================================================================="
exit 1
}
test $# -lt 5 && usage
test $# -gt 7 && usage
PRINT_IP=$1
USERNAME=$2
PASSWORD=$3
LOCALPATH=$4
REMOTEPATH=$5
FILENAME=$6
LOG=`date +%Y%m%d_%H.%M.%S`.log
command=command-`date +%Y%m%d_%H.%M.%S`.txt
echo "open ${PRINT_IP}"        >${command}
echo "user ${USERNAME} ${PASSWORD}" >>${command}
echo "binary"              >>${command}
echo "lcd ${LOCALPATH}"    >>${command}
echo "cd ${REMOTEPATH}"    >>${command}
echo "dir"                 >>${command}
echo "put ${FILENAME}"     >>${command}
echo "quit"                >>${command}

(/usr/bin/ftp -in < ${command} )  >${LOG}
exit 1
