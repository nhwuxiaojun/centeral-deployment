<?php
$con = mysql_connect("172.18.6.37","root","mysql");
mysql_select_db("tsop", $con);
$adddate=date('Y-m-d ',time());
//echo $adddate;

$query="select NO from ts_ip_map_matrix where  INTERNAL_IP='".$_POST["INTERNAL_IP2"]."' and  INTERNAL_PORT='".$_POST["INTERNAL_PORT2"]."'";
//echo $query;
$result = mysql_query($query);
$query1="select NO from ts_ip_map_matrix where  EXTERNAL_IP='".$_POST["EXTERNAL_IP2"]."' and  EXTERNAL_PORT='".$_POST["EXTERNAL_PORT2"]."'";
//echo $query1;
$result1 = mysql_query($query1);

$int_id=$_POST['ID2'];  	    
if(mysql_num_rows($result)!=0){     //数据库中有该记录  且 该记录的 NO 赋值给 $int_id
	$row = mysql_fetch_array($result,MYSQL_ASSOC);  
	if($row['NO']!=$_POST['ID2'])                  
	    $int_id=$row['NO'];  
}

$ext_id=$_POST['ID2'];  
if(mysql_num_rows($result1)!=0){     //数据库中有该记录  且 该记录的 NO 赋值给 $ext_id
	$row1 = mysql_fetch_array($result1,MYSQL_ASSOC);   
	if($row1['NO']!=$_POST['ID2'])
	    $ext_id=$row1['NO'];  	      
}
if($int_id==$_POST['ID2']&&$ext_id==$_POST['ID2']){        // 那必须是自己才行
	$adddate=date('Y-m-d ',time());
    //echo $adddate;
    $query3="update `ts_ip_map_matrix` set INTERNAL_IP='".$_POST["INTERNAL_IP2"]."',INTERNAL_PORT='".$_POST["INTERNAL_PORT2"]."',EXTERNAL_IP='". $_POST["EXTERNAL_IP2"]."',EXTERNAL_PORT='".$_POST["EXTERNAL_PORT2"]."',PROJ_CODE='".$_POST["PROJ_CODE2"]."',PROJ_NAME='".$_POST["PROJ_NAME2"]."' where no=".$_POST["ID2"]." ";
    //echo $query;
    $result3 = mysql_query($query3);
    if($result3!=0)
	    echo "修改成功";	
    else{
	    echo "修改失败";
	}
}
else 
	echo  "修改失败";

mysql_close($con);
?>