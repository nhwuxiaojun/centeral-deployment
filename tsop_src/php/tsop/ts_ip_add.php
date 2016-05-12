<?php
$con = mysql_connect("172.18.6.37","root","mysql");
mysql_select_db("tsop", $con);
$query="select no from ts_ip_map_matrix where  INTERNAL_IP='".$_POST["INTERNAL_IP"]."' and  INTERNAL_PORT='".$_POST["INTERNAL_PORT"]."'";
//echo $query;
$result = mysql_query($query);
$query1="select no from ts_ip_map_matrix where  EXTERNAL_IP='".$_POST["EXTERNAL_IP"]."' and  EXTERNAL_PORT='".$_POST["EXTERNAL_PORT"]."'";
//echo $query1;
$result1 = mysql_query($query1);
if(mysql_num_rows($result)==0&&mysql_num_rows($result1)==0){
$adddate=date('Y-m-d ',time());
//echo $adddate;
$query3="INSERT INTO `ts_ip_map_matrix`(INTERNAL_IP,INTERNAL_PORT,EXTERNAL_IP,EXTERNAL_PORT,PROJ_CODE,PROJ_NAME,APPLY_DATE)VALUES('" . $_POST["INTERNAL_IP"] . "'," . $_POST["INTERNAL_PORT"] .",'". $_POST["EXTERNAL_IP"] ."',".$_POST["EXTERNAL_PORT"].",'".$_POST["PROJ_CODE"]."','".$_POST["PROJ_NAME"]."','$adddate')";
//echo $query3;
$result3 = mysql_query($query3);
if($result3!=0)
	echo "添加成功";
}
else
	echo "添加失败";
mysql_close($con);
?>