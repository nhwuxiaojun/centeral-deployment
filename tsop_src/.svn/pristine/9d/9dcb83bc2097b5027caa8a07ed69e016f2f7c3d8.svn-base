<?php  

include_once('../Datagrid.php');
$expamle=new Datagrid();
$expamle->tables="`a_ftp_info`";
//aim to-> SELECT `cus_id` ,`cus_name`,`cus_address`,`cus_phone`  FROM `customer`  
$expamle->fields=array("proj_name","proj_code","username", "ftp_password", "ftp_type", "ftp_dir");
$expamle->fieldDisplays=array("proj_name"=>"Project name","proj_code"=>"Project Code","username"=>"Login ID","ftp_password"=>"Password", "ftp_type"=>"FTP Type", "ftp_dir"=>"FTP Directory");
$expamle->title="List of FTP Info Query";

//define search fields
$expamle->searchFields=array("proj_name"=>"Project Name", "username"=>"FTP Login ID");

$html=$expamle->display();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<link type="text/css" rel="stylesheet" href="../css/bluedream.css" /> 
<title>Customers</title>
 <body  >
 <table >
  <tr>
    <td><a href="?" >back</a>,&nbsp;&nbsp;Add form:  <a href="?datagrid_action=new" >here</a></td>
  </tr>
</table>
<?php 
echo $html;
?>

</body>
</html>
