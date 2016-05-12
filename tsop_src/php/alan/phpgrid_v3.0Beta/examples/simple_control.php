<?php  

include_once('../Datagrid.php');
$expamle=new Datagrid();
$expamle->tables="`customer`";
$expamle->fields=array("cus_id","cus_name","cus_address","cus_phone");
$expamle->fieldDisplays=array("cus_name"=>"Customer's name","cus_address"=>"Address","cus_phone"=>"Phone");
$expamle->title="List of customer";

$expamle->displayTableTitle=false;	//no display Table Title
$expamle->displayOrder=false;		//no display order 
$expamle->displayTableHeader=false;	//no display Table Header
$expamle->displaySearch=false;		//no display Search part
$expamle->displayControl=false;		//no display Control colums
$expamle->displayTableFooter=false;	//no display Footer 


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