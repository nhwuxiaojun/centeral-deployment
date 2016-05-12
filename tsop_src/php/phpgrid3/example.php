<?php 
 
 
include_once('Datagrid.php');

 
$expamle=new Datagrid();
$expamle->is_use_cache=false;
$expamle->sql="SELECT * FROM `tb_city`  limit 10";

$expamle->title="城市列表";

//$expamle->tables="`tb_city`";

//$expamle->fields=array("ct_id","ct_name as name","ct_username","ct_userid","ct_info","ct_memo");
 
$expamle->fieldDisplays=array("ct_name"=>"城市名称", "ct_userid"=>"用户ID" ,"ct_username"=>"城主","ct_info"=>"城市信息","ct_memo"=>"ct_memo" );
$expamle->searchFields=array("ct_name"=>"城市名称", "ct_userid"=>"用户ID");

$expamle->formTable="tb_city";
$expamle->formPrimkey="ct_id";
$expamle->formColsNum=2;
$expamle->formColsNum=1;
$expamle->formTypes=array('ct_id' =>'text',
						  'ct_name' => 'text',
						  'ct_userid' => 'text',
						  'ct_username' => 'text',
						  'ct_ux_blog' =>'text',
						  'ct_ux_pic' => 'text',
						  'ct_info' => 'simple_editor',
						  'ct_memo' => 'fckeditor',
						  'ct_itemid' => 'text',
						  'ct_pic' => 'file',
						  'ct_is_changed' => array('select',array(0=>"未改过城市名称",1=>"已修改过城市名称")),
						  'ct_test' => array ('list',array (1=>'1',2=>'2',3=>'3'))
			  );

$expamle->formFieldsValidates=array("ct_name"=>"Presence","ct_userid"=>"Numericality, {minimum: 1}");

//$test->hideField="ge_equipment";
$html=  $expamle->display();

$test=new Dataview();
$test->sql="SELECT * FROM `tb_building`  limit 1,10";
$test->formTable="tb_building";

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>产品列表</title>
<script type="text/javascript"> 
	if(getCookie('style_css')!=null){
		document.write('<link type="text/css" rel="stylesheet" href="css/'+getCookie('style_css')+'.css" />');
	}else{
		document.write('<link type="text/css" rel="stylesheet" href="css/oranges-in-the-sky.css" />');
	} 
	//写cookies函数 作者：翟振凯
	function SetCookie(name,value)//两个参数，一个是cookie的名子，一个是值
	{
	    var Days = 30; //此 cookie 将被保存 30 天
	    var exp  = new Date();    //new Date("December 31, 9998");
	    exp.setTime(exp.getTime() + Days*24*60*60*1000);
	    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
	}
	function getCookie(name)//取cookies函数        
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
echo $html; 
?>
</body>
</html>