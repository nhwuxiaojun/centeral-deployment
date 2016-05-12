<?php  

include_once('../Datagrid.php');
$expamle=new Datagrid();
$expamle->tables="`customer`";
//aim to-> SELECT `cus_id` ,`cus_name`,`cus_address`,`cus_phone`  FROM `customer`  
$expamle->fields=array("cus_id","cus_userid","cus_name","cus_email","cus_dept","cus_address","cus_phone","cus_pic","cus_memo");
$expamle->fieldDisplays=array("cus_name"=>"Customer's name",
							  "cus_userid"=>"User",
							  "cus_email"=>"Email",
							  "cus_dept"=>"Department",
							  "cus_address"=>"Address",
							  "cus_phone"=>"Phone",
							  "cus_pic"=>"Pictrue",
							  "cus_memo"=>"Memo");
$expamle->title="List of customer";

$expamle->formTable="`customer`";
$expamle->formFields=$expamle->fieldDisplays;
$expamle->formColsNum=1;	//Set the form for a few columns

$user_list=array(1=>"Mark",2=>"Jockson",3=>"Tom",4=>"Sun");
$expamle->formTypes=array('cus_name' =>'text',
						  'cus_email' => 'text', 
						  'cus_address' => 'simple_editor',
						  'cus_memo' => 'fckeditor',
						  'cus_pic'=>'file',
						  'cus_phone'=>'text',
						  'cus_userid' => array('select',$user_list),
						  'cus_dept' => array ('list',array (1=>'HR',2=>'Information',3=>'BI'))
			  );


//use livevalidation1.3 javascript libary
//how to use? See http://livevalidation.com/
$expamle->formFieldsValidates=array("cus_name"=>"Presence",
									"cus_userid"=>"Presence", 
									"cus_email"=>"Email",
									"cus_phone"=>"Numericality, {minimum: 11}");

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