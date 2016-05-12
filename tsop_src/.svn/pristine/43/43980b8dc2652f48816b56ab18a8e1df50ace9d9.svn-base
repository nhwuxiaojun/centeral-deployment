<?php  
include_once('../Datagrid.php');
$expamle=new Datagrid();
$expamle->sql="SELECT * FROM `customer`";
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
	    <td>
	    <a href="?" >back</a>,&nbsp;&nbsp;Add form:  
	    <a href="?datagrid_action=new" >here</a>
	    </td>
	  </tr>
	</table>
	<?php 
	echo $html;
	?>
</body>
</html>