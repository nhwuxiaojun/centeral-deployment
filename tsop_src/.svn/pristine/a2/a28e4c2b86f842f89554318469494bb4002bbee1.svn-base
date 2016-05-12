<?php

include_once('../Datagrid.php');
$expamle=new Dataview();
$expamle->sql="SELECT * FROM `customer` left join `user` on user_id=cus_userid";
$expamle->fieldDisplays=array("cus_name"=>"Customer","user_name"=>"User","cus_pic"=>"Pictrue","cus_address"=>"Address","cus_phone"=>"Phone");
$html=$expamle->display();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="../css/bluedream.css" />
<title>Customers</title>


<body>
<?php
echo $html;
?>

</body>
</html>
