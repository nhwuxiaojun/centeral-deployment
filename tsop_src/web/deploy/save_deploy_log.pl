#!/opt/ActivePerl-5.16/bin/perl
use DBI;
print $ARGV[0];

print $ARGC."\n";

if (!$ARGV[0]) {
        print "Usage: $ARGV[0] <env_name> <pkg_name>\n";
}
else {
$dbname="ora189";
$user="ts_op_read";
$passwd="ts_op_read_only";
$dbh="";
$dbh = DBI->connect("dbi:Oracle:$dbname",$user,$passwd) or die "can't connect to database ". DBI-errstr;
#$sth=$dbh->prepare("select a.env_ip, a.env_usr, a.env_pwd, a.app_inst_path, b.db_user, b.db_user_passwd, b.db_ldap_name, c.env_name from ts_env_app a, ts_env_db b, ts_env c where a.env_id=c.env_id and c.env_id=b.env_id and c.env_name='".$ARGV[0]."'");
#$sth=$dbh->prepare("select a.env_ip,a.env_usr,a.env_pwd,a.app_inst_path,b.db_user,b.db_user_passwd,b.db_ldap_name,c.env_name,e.account ts,a.PROPOSER dm  from ts_env_app a, ts_env_db b, ts_env c, ts_proj d, ts_member e where a.env_id = c.env_id  and c.env_id = b.env_id and c.proj_id=d.proj_id and d.owner1=e.no(+) and c.env_name = '".$ARGV[0]."'");
$sth=$dbh->prepare("insert into ts_deploy_log(no,env_id,version,start_time) values(s_deploy_log__id.nextval,'.$ARGV[0].','.$ARGV[1].',sysdate)");
$sth->execute;

close(OUTPUT);
$dbh->disconnect;

print $ENV_IP;

} # end of else
exit 1;
