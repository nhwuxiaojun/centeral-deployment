#!/opt/ActivePerl-5.16/bin/perl
use DBI;
#print $ARGV[0];

print $ARGC."\n";

if (!$ARGV[0]) {
        print "Usage: $ARGV[0] <env_id> <pkg_name> <log_id> <deployer> <path>\n";
}
else {
$dbname="ora189";
$user="ts_op_read";
$passwd="ts_op_read_only";
$dbh="";
$dbh = DBI->connect("dbi:Oracle:$dbname",$user,$passwd) or die "can't connect to database ". DBI-errstr;
#$sth=$dbh->prepare("select a.env_ip, a.env_usr, a.env_pwd, a.app_inst_path, b.db_user, b.db_user_passwd, b.db_ldap_name, c.env_name from ts_env_app a, ts_env_db b, ts_env c where a.env_id=c.env_id and c.env_id=b.env_id and c.env_name='".$ARGV[0]."'");
#$sth=$dbh->prepare("select a.env_ip,a.env_usr,a.env_pwd,a.app_inst_path,b.db_user,b.db_user_passwd,b.db_ldap_name,c.env_name,e.account ts,a.PROPOSER dm  from ts_env_app a, ts_env_db b, ts_env c, ts_proj d, ts_member e where a.env_id = c.env_id  and c.env_id = b.env_id and c.proj_id=d.proj_id and d.owner1=e.no(+) and c.env_name = '".$ARGV[0]."'");
my $row=$dbh->do("insert into ts_deploy_log(no,env_id,version,deployer,path,start_time) values(".$ARGV[2].",'".$ARGV[0]."','".$ARGV[1]."','".$ARGV[3]."','".$ARGV[4]."',sysdate)");
#my $row=$dbh->do("insert into ts_env_version(env_id,version) values(".$ARGV[0].",'".$ARGV[1]."')");
#my $row=$dbh->do("update ts_env_version set version='".$ARGV[1]."' where env_id=".$ARGV[0]);
my $row=$dbh->do("update a_proj_env_svr set app_version='".$ARGV[1]."' where env_id=".$ARGV[0]);
#$sth->execute;

close(OUTPUT);
$dbh->disconnect;

#print $ENV_IP;

} # end of else
exit 1;
