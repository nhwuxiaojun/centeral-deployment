<?php  
//first 
include_once('../Datagrid.php');
$gridObj=new Datagrid();
$gridObj->tables="`customer`";
//aim to-> SELECT `cus_id` ,`cus_name`,`cus_address`,`cus_phone`  FROM `customer`  
$gridObj->fields=array("cus_id","cus_name","cus_address","cus_phone");
$gridObj->fieldDisplays=array("cus_name"=>"Customer's name","cus_address"=>"Address","cus_phone"=>"Phone");
$gridObj->title="List of customer";
$gridHtml=$gridObj->display();

//second
$viewObj=new Dataview();
$viewObj->sql="SELECT * FROM `customer` left join `user` on user_id=cus_userid";
$viewObj->fieldDisplays=array("cus_name"=>"Customer","user_name"=>"User","cus_pic"=>"Pictrue","cus_address"=>"Address","cus_phone"=>"Phone");
$viewHtml=$viewObj->display();

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<link type="text/css" rel="stylesheet" href="../css/bluedream.css" /> 
<title>Customers</title>
 <body  >
<?php 
echo $gridHtml;
?>
<p><p>

<?php 
echo $viewHtml;
?>
</body>
</html>