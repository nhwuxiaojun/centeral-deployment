<?php
    $con = mysql_connect("172.18.6.37","root","mysql");
    mysql_select_db("tsop", $con);
    $id=$_GET['id'];
	//echo $id;
    $query="delete from ts_ip_map_matrix  where NO='$id' ";
	//echo $query;
    $result = mysql_query($query); 
    if($result)
	   echo '1';
    else 
	   echo '0';
    mysql_close($con);
?>