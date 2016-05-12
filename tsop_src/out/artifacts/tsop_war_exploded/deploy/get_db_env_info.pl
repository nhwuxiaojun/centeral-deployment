#!/opt/ActivePerl-5.16/bin/perl
use DBI;
#print $ARGV[0];

print $ARGC."\n";

if (!$ARGV[0]) {
        print "Usage: $ARGV[0] env_name\n";
}
else {
$dbname="ora189";
$user="ts_op_read";
$passwd="ts_op_read_only";
$dbh="";
$dbh = DBI->connect("dbi:Oracle:$dbname",$user,$passwd) or die "can't connect to database ". DBI-errstr;
#$sth=$dbh->prepare("select a.env_ip,a.env_usr,a.env_pwd,a.app_inst_path,b.db_user,b.db_user_passwd,b.db_ldap_name,c.env_name,e.account ts,d.dm, c.env_id,s_deploy_log__id.nextval,d.cm,f.db_ip,f.db_sid,f.db_port_num,g.print_ip,g.print_user,g.print_pwd,a.print_dir  from ts_env_app a, ts_env_db b, ts_env c, ts_proj d, ts_member e, ts_db f, ts_print g where a.env_id = c.env_id  and c.env_id = b.env_id and b.db_ldap_name=f.ldap_name and c.proj_id=d.proj_id(+) and d.owner1=e.no(+) and a.print_ip=g.print_ip(+) and c.env_name = '".$ARGV[0]."'");

$sth=$dbh->prepare("select b.db_user,b.db_user_passwd,b.db_ldap_name,b.proj_env env_name,e.account ts,d.dm,b.db_id env_id,s_deploy_log__id.nextval,d.cm,f.db_ip,f.db_sid,f.db_port_num from ts_env_db b,ts_env c,ts_proj d,ts_member e,ts_db f where c.env_id(+)=b.db_id and b.db_ldap_name=f.ldap_name(+) and c.proj_id=d.proj_id(+) and d.owner1=e.no(+) and b.proj_env='".$ARGV[0]."'");
$sth->execute;
#open (OUTPUT,">/tmp/env_info.sh") or die "cannot open file env_info.sh for writing. ";
while (@recs=$sth->fetchrow_array) {
	open (OUTPUT,">/usr/local/deploy/$recs[3]/env_info.sh") or die "cannot open file $recs[7]/env_info.sh for writing. ";
        print OUTPUT "export DBUSER=$recs[0]\n";
        print OUTPUT "export DBPASS=$recs[1]\n";
        print OUTPUT "export DBLDAP=$recs[2]\n";
        print OUTPUT "export PROJNAME=$recs[3]\n";
        print OUTPUT "export TS=$recs[4]\n";
        print OUTPUT "export DM=$recs[5]\n";
        print OUTPUT "export ENV_ID=$recs[6]\n";
        print OUTPUT "export LOG_ID=$recs[7]\n";
        print OUTPUT "export CM=$recs[8]\n";
        print OUTPUT "export DBIP=$recs[9]\n";
        print OUTPUT "export DBSID=$recs[10]\n";
        print OUTPUT "export DBPORT=$recs[11]\n";
	exit 0;
} # end of while

close(OUTPUT);
$dbh->disconnect;

#print $ENV_IP;

} # end of else
exit 1;
