<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<html>
<head>
<title>现场备份检查确认表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.text
{
    font-size:9pt;
    color:black;
    border-bottom-width:1pt;
    border-bottom-color:Black;
    border-top-width:0pt;
    border-top-color:Black;
    border-left-width:0pt;
    border-left-color:Black;
    border-right-width:0pt;
    border-right-color:Black;
}
.button1
{   height:14pt;
    width:30pt;
    font-size:9pt;
    color:black;
    border-bottom-width:1pt;
    border-bottom-color:Black;
    border-top-width:1pt;
    border-top-color:Black;
    border-left-width:1pt;
    border-left-color:Black;
    border-right-width:1pt;
    border-right-color:Black;	 
}
-->
</style>
</head>
<script src="calendar.js" language="javascript" type="text/javascript"></script>
<body><%@include file="includes/head.html" %>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">现场备份检查确认表</span></strong></font>
</div>
<form name="form1" action="scene_backup_check_finish.jsp" method="post" class="en">
<table align="center" cellpadding="0" cellspacing="0" border="0" width="90%">
  <tr> 
    <td width="40%" class="en" colspan="2">项目名称：<input type="text" name="project_name" value="" class="text" size="64"></td>
  </tr>
  <tr> 
    <td width="40%" height="20" class="en" colspan="2">&nbsp;</td>
  </tr>
  <tr> 
    <td width="40%" class="en" colspan="2">
	环境个数：
	<select name="env_num" onChange="change_env()">
	  <%for(int i=1;i<100;i++){%>
	    <option value="<%=i%>"><%=i%></option>
	  <%}%>
	</select></td>
  </tr>
  <tr> 
    <td id="change_td" width="40%" height="20" class="en" colspan="2"><br>环境1：<input type="text" name="env_1" value="" class="text" size="30"></td>
  </tr>
  <tr> 
    <td width="40%" height="20" class="en" colspan="2">&nbsp;</td>
  </tr>
  <tr> 
    <td width="40%" class="en">开始时间：<input type="text" name="start_date" value="" class="text" size="10" onFocus="show_cele_date(start_date,'','',start_date)"></td>
	<td width="40%" class="en">结束时间：<input type="text" name="end_date" value="" class="text" size="10" onFocus="show_cele_date(end_date,'','',end_date)"></td>
  </tr>
  <tr> 
    <td width="40%" height="20" class="en" colspan="2">&nbsp;</td>
  </tr>
  <tr> 
    <td width="40%" class="en">带回人员：<input type="text" name="take_person" value="" class="text" size="10"></td>
	<td width="40%" class="en">带回时间：<input type="text" name="take_date" value="" class="text" size="10" onFocus="show_cele_date(take_date,'','',take_date)"></td>
  </tr>
  <tr> 
    <td width="40%" height="20" class="en" colspan="2">&nbsp;</td>
  </tr>
  <tr> 
    <td width="40%" class="en">检查人员：<input type="text" name="check_person" value="" class="text" size="10"></td>
	<td width="40%" class="en">检查时间：<input type="text" name="check_date" value="" class="text" size="10" onFocus="show_cele_date(check_date,'','',check_date)"></td>
  </tr>
  <tr> 
    <td width="40%" height="20" class="en" colspan="2">&nbsp;</td>
  </tr>
  <tr> 
    <td width="40%" class="en" colspan="2">测试结果说明：<input type="text" name="test_result" value="" class="text" size="60"></td>
  </tr>
  <tr> 
    <td width="40%" height="20" class="en" colspan="2">&nbsp;</td>
  </tr>
  <tr> 
    <td width="40%" class="en" colspan="2">抽样时间：<input type="text" name="sample_date" value="" class="text" size="10" onFocus="show_cele_date(sample_date,'','',sample_date)"></td>
  </tr>
  <tr> 
    <td width="40%" height="20" class="en" colspan="2">&nbsp;</td>
  </tr>
</table>
<div align="center">
<input type="button" name="button1" class="button1" value="提交" onClick="check()">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="reset1" class="button1" value="重置">
</div>
</form>
<jsp:include page="includes/copyright.jsp" /></body>
<script language="JavaScript">
function check(){
	if(form1.project_name.value==""){
		alert("请输入项目名称");
		return;
	}
	var sum=eval(form1.env_num.value);
	for(i=0;i<sum;i++){
		if(eval("form1.env_"+(i+1)+".value")==""){
			alert("请输入环境"+eval(i+1));
			return;
		}
	}
	if(form1.start_date.value==""){
		alert("请输入开始时间");
		return;
	}
	if(form1.end_date.value==""){
		alert("请输入结束时间");
		return;
	}
	if(form1.take_person.value==""){
		alert("请输入带回人员");
		return;
	}
	if(form1.take_date.value==""){
		alert("请输入带回时间");
		return;
	}
	if(form1.check_person.value==""){
		alert("请输入检查人员");
		return;
	}
	if(form1.check_date.value==""){
		alert("请输入检查时间");
		return;
	}
	if(form1.test_result.value==""){
		alert("请输入测试结果说明");
		return;
	}
	if(form1.sample_date.value==""){
		alert("请输入抽样时间");
		return;
	}
	form1.submit();
}
function change_env(){
	var sum=eval(form1.env_num.value);
	var change_temp="";
	for(i=0;i<sum;i++){
		change_temp=change_temp+"<br>环境"+eval(i+1)+"：<input type=\"text\" name=\"env_"+eval(i+1)+"\" value=\"\" class=\"text\" size=\"30\"><br>";
	}
	//alert(change_temp);
	change_td.innerHTML=change_temp;
}
</script>
<script language="JavaScript" for="document" event="onkeypress">
	if(event.keyCode==13){
		check();
	}
</script>
</html>
