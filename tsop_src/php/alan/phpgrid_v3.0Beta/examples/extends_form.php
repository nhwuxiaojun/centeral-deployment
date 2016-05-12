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
	
	/**
	 *重写生成新增表单
	 */
	public function setNewFormHtml() {
		$html='
			<table   id="formHtml" >
		           <tr>
			        <td  colspan="4"  ><span >自己定义添加表单</span></td>
			      </tr> 
			      
			           <td  >Customer  name</td>
			            <td  ><input type="text" id="cus_name" name="cus_name"   value=""    > </td>
			            
			           <td  >User</td>
			            <td  ><select name="cus_userid"   id="cus_userid">
			            	<option value=1>Mark</option>
			            	<option value=2>Jockson</option>
			            	<option value=3>Tom</option>
			            	<option value=4>Sun</option>
			            	</select> </td>
			            </tr>
			           <td  >Pictrue</td>
			            <td  >文件路径：<a href="../"  target="_blank"></a><br>
						 <input name="cus_pic" id="cus_pic" type="file"   />  </td>
			            
			           <td  >Address</td>
			            <td  ><input type="text" id="cus_address" name="cus_address"   value=""    > </td>
			            </tr>
			           <td  >Phone</td>
			            <td  ><input type="text" id="cus_phone" name="cus_phone"   value=""    > </td>
			            
			           <td  ></td>
			            <td  > </td>
			            </tr><tr >
			        <td colspan="4">
			          <div align="center">
  					<input type="submit" name="Submit" value="提交">
 					 &nbsp;&nbsp;<input type="reset" name="Submit2" value="重置">
			          </div></td>
		         </tr>     </table> 
		';
		
		return $html;
	}	

	/**
	 *重写生成编辑表单
	 */
	public function setEditFormHtml() {
		return $this->makeFormHtml('edit');
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