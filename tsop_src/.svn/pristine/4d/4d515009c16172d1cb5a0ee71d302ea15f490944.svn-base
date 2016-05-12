#!/opt/ActivePerl-5.16/bin/perl
use DBI;
#print $ARGV[0];

print $ARGC."\n";

if (!$ARGV[0]) {
        print "Usage: $ARGV[0] <db_id=env_id> <pkg_name> <log_id> <deployer> <path>\n";
}
else {
$dbname="ora189";
$user="ts_op_read";
$passwd="ts_op_read_only";
$dbh="";
$dbh = DBI->connect("dbi:Oracle:$dbname",$user,$passwd) or die "can't connect to database ". DBI-errstr;
my $row=$dbh->do("insert into ts_deploy_log(no,env_id,version,deployer,path,start_time) values(".$ARGV[2].",'".$ARGV[0]."','".$ARGV[1]."','".$ARGV[3]."','".$ARGV[4]."',sysdate)");
my $row=$dbh->do("update a_db_svr set db_version='".$ARGV[1]."' where db_id=".$ARGV[0]);
#$sth->execute;

close(OUTPUT);
$dbh->disconnect;

#print $ENV_IP;

} # end of else
exit 1;
