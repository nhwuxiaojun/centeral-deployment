#!/opt/ActivePerl-5.16/bin/perl
use DBI;
#print $ARGV[0];

print $ARGC."\n";

if (!$ARGV[0]) {
        print "Usage: $ARGV[0] <db_id=env_id> <log_id>\n";
}
else {
$dbname="ora189";
$user="ts_op_read";
$passwd="ts_op_read_only";
$dbh="";
$dbh = DBI->connect("dbi:Oracle:$dbname",$user,$passwd) or die "can't connect to database ". DBI-errstr;
$sth=$dbh->do("update ts_op.ts_deploy_log set end_time=sysdate,result='".$ARGV[2]."' where no=".$ARGV[1]." and env_id=".$ARGV[0]);
close(OUTPUT);
$dbh->disconnect;

#print $ENV_IP;

} # end of else
exit 1;
