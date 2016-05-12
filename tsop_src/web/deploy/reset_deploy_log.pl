#!/opt/ActivePerl-5.16/bin/perl
use DBI;
#print $ARGV[0];

print $ARGC."\n";

$dbname="ora189";
$user="ts_op_read";
$passwd="ts_op_read_only";
$dbh="";
$dbh = DBI->connect("dbi:Oracle:$dbname",$user,$passwd) or die "can't connect to database ". DBI-errstr;
$sth=$dbh->do("update ts_deploy_log a set a.end_time=sysdate,a.result='abnormal' where a.end_time is null");
$dbh->disconnect;
