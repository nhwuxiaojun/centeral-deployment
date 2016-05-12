<?php  

include_once('../Datagrid.php');

$GLOBALS['user_list']=array(1=>"Mark",2=>"Jockson",3=>"Tom",4=>"Sun");


/**
 * extend Datagrid ,rewrite the public of function
 * 
 * @author cdwei
 *
 */
class myclass extends Datagrid{
	
	//rewrite this function to custom   table body
	function repalceValue($row,$field,$value) {
		if($field=="cus_userid"){
			return $GLOBALS['user_list'][$value];
		}
		if($field=="cus_pic"){ 
			return '<img src="../'.$value.'"  width="30%" height="30%" />';
		}
		if($field=="cus_name"){
			return  '<font color=blue>'.$value.'</font>';
		}
		return $value;
	}
}

$expamle=new myclass();
$expamle->tables="`customer`";
//aim to-> SELECT `cus_id` ,`cus_name`,`cus_address`,`cus_phone`  FROM `customer`  
$expamle->fields=array("cus_id","cus_name","cus_userid","cus_pic","cus_address","cus_phone");
$expamle->fieldDisplays=array("cus_name"=>"Customer's name","cus_userid"=>"User","cus_pic"=>"Pictrue","cus_address"=>"Address","cus_phone"=>"Phone");
$expamle->title="List of customer";

$expamle->formTable="`customer`";
$expamle->formFields=$expamle->fieldDisplays;


$expamle->formTypes=array('cus_name' =>'text',
						  'cus_email' => 'text', 
						  'cus_address' => 'text',
						  'cus_pic'=>'file',
						  'cus_phone'=>'text',
						  'cus_userid' => array('select',$GLOBALS['user_list']) 
			  );
 
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