# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH

export ORACLE_BASE=/opt/oracle3
export ORACLE_HOME=$ORACLE_BASE/product/11.2.0/client_3
export PATH=$PATH:$ORACLE_HOME/bin:/usr/bin:/usr/sbin:/usr/lib
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH
export ORA_NLS33=$ORACLE_HOME/ocommon/nls/admin/data
#export NLS_LANG=AMERICAN_AMERICA.UTF8
export JAVA_HOME=/usr/local/deploy/jdk1.6.0_31

alias perl='/opt/ActivePerl-5.16/bin/perl'
alias python='/opt/ActivePython-2.7/bin/python'
cd /usr/local/deploy
umask 002
