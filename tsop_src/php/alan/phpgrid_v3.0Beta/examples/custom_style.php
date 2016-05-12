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
<title>Customers</title>
<script type="text/javascript"> 
	if(getCookie('style_css')!=null){
		document.write('<link type="text/css" rel="stylesheet" href="../css/'+getCookie('style_css')+'.css" />');
	}else{
		document.write('<link type="text/css" rel="stylesheet" href="../css/oranges-in-the-sky.css" />');
	} 
	//写cookies函数 作者：翟振凯
	function SetCookie(name,value)
	{
	    var Days = 30;  
	    var exp  = new Date();    //new Date("December 31, 9998");
	    exp.setTime(exp.getTime() + Days*24*60*60*1000);
	    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
	}
	function getCookie(name)
	{
	    var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
	     if(arr != null) return unescape(arr[2]); return null;

	}
</script> 
 
 <body  >

<table      >
  <tr>
    <td>当前位置：<a href="?" >数据列表</a>,&nbsp;&nbsp;添加请点  <a href="?datagrid_action=new" >这里</a>&nbsp;&nbsp;&nbsp;更换皮肤 
		   <select name="style_cass" id="style_css" onChange="SetCookie('style_css',this.value);window.location.reload();" >
			  <option  >请选择</option>
			   <option value="oranges-in-the-sky">oranges-in-the-sky.css</option>
			   <option value="bluedream">bluedream.css</option>
			   <option value="classic_somehow">classic_somehow.css</option>
			   <option value="itunes">itunes.css</option>
			   <option value="mintgreen">mintgreen.css</option>
			   <option value="seaglass">seaglass.css</option> 
			   <option value="pure_blue">pure_blue.css</option> 
			   <option value="dartblue">dartblue.css</option>  
		 </select>
 </td>
  </tr>
</table>
<?php 
echo $gridHtml;
?>
<p><p>

<?php 
echo $viewHtml;
?>
</body>
</html>