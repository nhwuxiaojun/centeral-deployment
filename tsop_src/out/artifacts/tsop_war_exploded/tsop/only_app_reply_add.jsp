<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>单应用环境答复</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.text1
{
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
.text2
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
	width:400
}
.text3
{
    font-weight: normal; 
	color:#000000; 
	font-size: 11px;
	height: 19px;
	border: 1px solid #000000;
	padding-top:2px;
	font-family: Verdana;
}
.button1
{
    height:14pt;
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
.select1
{
	font-weight: normal; 
	color:#000000; 
	font-size: 11px;
	height: 20px;
	width: 170px;
	border: 1px solid  #7C96B1;	
	font-family: Verdana;
}
.select2 
{
	font-weight: normal; 
	color:#000000; 
	font-size: 11px;
	height: 20px;
	width: 120px;
	border: 1px solid  #7C96B1;	
	font-family: Verdana;
}
.select3 
{
	font-weight: normal; 
	color:#000000; 
	font-size: 11px;
	height: 20px;
	width: 100px;
	border: 1px solid  #7C96B1;	
	font-family: Verdana;
}
.select4 
{
	font-weight: normal; 
	color:#000000; 
	font-size: 11px;
	height: 20px;
	width: 80px;
	border: 1px solid  #7C96B1;	
	font-family: Verdana;
}
.select5 
{
	font-weight: normal; 
	color:#000000; 
	font-size: 11px;
	height: 20px;
	width: 100px;
	border: 1px solid  #7C96B1;	
	font-family: Verdana;
}
.select6
{
	font-weight: normal; 
	color:#000000; 
	font-size: 11px;
	height: 20px;
	width: 360px;
	border: 1px solid  #7C96B1;	
	font-family: Verdana;
}
.STYLE1 {color: #3333cc}
-->
</style>
</head>
<script src="calendar.js" language="javascript" type="text/javascript"></script>

<%
DBean db = new DBean();
String sql = new String();
ResultSet rs;
%>

<body><%@include file="includes/head.html" %>
<br><br>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">单应用环境答复</span></strong></font>
</div>

<form name="form1" action="only_app_reply_add_finish.jsp" method="post" class="en">
<%if("".equals(request.getParameter("info"))){%>

<%}else{%>
  <div align="center"><font color="#FF0000" style="{font-size:9pt;}"><%=Tools.toGB(request.getParameter("info"))%></font></div>
<%}%>

<table width="95%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>新环境名称：</strong></td>
	<%
	sql=" select  new_env from a_apply where status='DOING' and apply_type='APP' ";
	rs=db.execSQL(sql);
	%>
    <td class="en" width="78%">
	<select name="new_env" class="select1" onChange="change_env()">
	<option value="">请选择</option>
	<%while(rs.next()){%>
	<option value="<%=rs.getString("new_env")%>"><%=rs.getString("new_env")%></option>
	<%}%>
	</select>
	</td>
  </tr>
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>搭建环境服务器：</strong></td>
	<%
	sql="select distinct mac_ip from a_hardware";
	rs=db.execSQL(sql);
	%>
    <td class="en" width="78%">
	<select name="mac_ip" class="select2">
	<option value="">请选择</option>
	<%while(rs.next()){%>
	<option value="<%=rs.getString("mac_ip")%>"><%=rs.getString("mac_ip")%></option>
	<%}%>
	</select>
	</td>
  </tr>
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>应用使用IP：</strong></td>
    <td width="78%" class="en">
	<%
	sql="select distinct ip_list from a_ip where ip_status='NO'";
	rs=db.execSQL(sql);
	%>
		<div style="position:relative;">
			<select name="env_ip" class="select2"
					onchange="document.getElementById('env_ip_input').value=this.value">
				<option value="">请选择</option>
				<%while (rs.next()) {%>
				<option value="<%=rs.getString("ip_list")%>"><%=rs.getString("ip_list")%>
				</option>
				<%}%>
			</select>
			<input id="env_ip_input" name="env_ip_input" placeholder="x.x.x.x" required
				   pattern="((^|\.)((25[0-5])|(2[0-4]\d)|(1\d\d)|([1-9]?\d))){4}$"
				   style="position:absolute;width:92px;height:16px;left:1px;top:2px;border-bottom:0px;border-right:0px;border-left:0px;border-top:0px;">
		</div>
	</td>
  </tr>


  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>应用环境用户名：</strong></td>
    <td width="78%" class="en">
	<input type="text" name="app_user" value="" class="text2">
	</td>
  </tr>
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>应用环境目录：</strong></td>
    <td width="78%" class="en">
	<input type="text" name="app_dir" value="" class="text2">
	</td>
  </tr>
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>是否邮件通知：</strong></td>
    <td width="78%" class="en">
	<input type="checkbox" name="send_email" checked="checked" value="1">
	</td>
  </tr>
</table>
<br><br>
<div align="center">
<input type="button" name="button1" class="button1" value="提交" onClick="check()">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="reset1" class="button1" value="重置">
</div>
</form>
<%
db.close();
rs.close();
%>
</body>
<script language="JavaScript">
function change_env(){
	if(form1.new_env.value==""){
		form1.app_user.value = "";
		form1.app_dir.value = "";
	}else{
		form1.app_user.value = form1.new_env.value;
		form1.app_dir.value = "/usr/local/" + form1.new_env.value;
	}
}
function check(){
	if(form1.new_env.value==""){
		alert("请选择新环境名称");
		form1.new_env.focus();
		return;
	}
	if(form1.mac_ip.value==""){
		alert("请选择物理IP");
		form1.mac_ip.focus();
		return;
	}
	if(form1.env_ip_input.value==""){
		alert("请选择环境IP");
		form1.env_ip_input.focus();
		return;
	}
	form1.submit();
}
</script>
<script language="JavaScript" for="document" event="onkeypress">
	if(event.keyCode==13){
		check();
	}
</script>
</html>
