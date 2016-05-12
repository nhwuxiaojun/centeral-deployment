<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>Demo环境表修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
<style type="text/css">
.STYLE1 {color: #3333cc}
.text
{
    font-size:9pt;
    color:black;
	vertical-align:middle;
    border-bottom-width:1pt;
    border-bottom-color:Black;
    border-top-width:1pt;
    border-top-color:Black;
    border-left-width:1pt;
    border-left-color:Black;
    border-right-width:1pt;
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
.STYLE1 {color: #3333cc}
-->
</style>
</head>
<script src="calendar2.js" language="javascript" type="text/javascript"></script>
<%
DBean db = new DBean();
String sql = new String();
ResultSet rs;
sql = "select * from a_proj_demo_svr where id = " + request.getParameter("id");
rs = db.execSQL(sql);
%>
<%while(rs.next()){%>
<body><%@include file="includes/head.html" %>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">Demo环境表修改</span></strong></font>
</div>
<form name="form1" action="env_info_demo_upd_finish.jsp" method="post" class="en">
<table width="80%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO主机ip</strong></td>
    <td class="en" width="63%"><input type="text" name="MAC_IP" value="<%=rs.getString("MAC_IP")%>" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO主机登陆名</strong></td>
    <td class="en" width="63%"><input type="text" name="OS_USR" value="<%=rs.getString("OS_USR")%>" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO主机登陆密码</strong></td>
    <td class="en" width="63%"><input type="text" name="OS_PWD" value="<%=rs.getString("OS_PWD")%>" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO项目环境名</strong></td>
    <td class="en" width="63%"><input type="text" name="PROJ_NAME" value="<%=rs.getString("PROJ_NAME")%>" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO项目环境版本</strong></td>
    <td class="en" width="63%"><input type="text" name="PROJ_VER" value="<%=rs.getString("PROJ_VER")%>" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO文件存放地址</strong></td>
    <td class="en" width="63%"><input type="text" name="DEMO_LOC" value="<%=rs.getString("DEMO_LOC")%>" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO环境应用ip</strong></td>
    <td class="en" width="63%"><input type="text" name="DEMO_APP_IP" value="<%=rs.getString("DEMO_APP_IP")%>" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO应用环境版本</strong></td>
    <td class="en" width="63%"><input type="text" name="DEMO_APP_EDI" value="<%=rs.getString("DEMO_APP_EDI")%>" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO环境数据库ip</strong></td>
    <td class="en" width="63%"><input type="text" name="DEMO_DB_IP" value="<%=rs.getString("DEMO_DB_IP")%>" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO数据库环境版本：</strong></td>
    <td class="en" width="63%"><input type="text" name="DEMO_DB_EDI" value="<%=rs.getString("DEMO_DB_EDI")%>" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO环境内部登陆页面</strong></td>
    <td class="en" width="63%"><input type="text" name="DEMO_INTRA_WEB" value="<%=rs.getString("DEMO_INTRA_WEB")%>" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO环境外部登陆页面</strong></td>
    <td class="en" width="63%"><input type="text" name="DEMO_OUTER_WEB" value="<%=rs.getString("DEMO_OUTER_WEB")%>" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO环境搭建时间</strong></td>
    <td class="en" width="63%"><input type="text" name="DEMO_CREATE_TIME" value="<%=rs.getDate("DEMO_CREATE_TIME")%>" class="en" size="35" onFocus="show_cele_date(DEMO_CREATE_TIME,'','',DEMO_CREATE_TIME)"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO环境运行状态</strong></td>
    <td class="en" width="63%"><input type="text" name="DEMO_STATUS" value="<%=rs.getString("DEMO_STATUS")%>" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO环境登记人</strong></td>
    <td class="en" width="63%"><input type="text" name="DEMO_SIGNER" value="<%=session.getAttribute("username")%>" class="en" size="35" readonly></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO信息备注</strong></td>
    <td class="en" width="63%"><input type="text" name="DEMO_NOTE" value="<%=rs.getString("DEMO_NOTE")%>" class="en" size="35"></td>
  </tr>
</table>
<input type="hidden" name="id" value="<%=rs.getInt("ID")%>">
<br>
<div align="center">
<input type="button" name="button1" value="提交" onClick="check()" class="button1">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="reset1" value="重置" class="button1">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="button2" value="返回" onClick="return_back()" class="button1">
</div>
</form>
<jsp:include page="includes/copyright.jsp" /></body>
<%}%>
<script language="JavaScript">
function check(){
	if(form1.MAC_IP.value==""){
		alert("请输入DEMO主机ip");
		return;
	}
	if(form1.OS_USR.value==""){
		alert("请输入DEMO主机登陆名");
		return;
	}
	if(form1.OS_PWD.value==""){
		alert("请输入DEMO主机登陆密码");
		return;
	}
	if(form1.PROJ_NAME.value==""){
		alert("请输入DEMO项目环境名");
		return;
	}
	if(form1.PROJ_VER.value==""){
		alert("请输入DEMO项目环境版本");
		return;
	}
	if(form1.DEMO_LOC.value==""){
		alert("请输入DEMO文件存放地址");
		return;
	}
	if(form1.DEMO_APP_IP.value==""){
		alert("请输入DEMO环境应用ip");
		return;
	}
	if(form1.DEMO_DB_IP.value==""){
		alert("请输入DEMO环境数据库ip");
		return;
	}
	if(form1.DEMO_INTRA_WEB.value==""){
		alert("请输入DEMO环境内部登陆页面");
		return;
	}
	if(form1.DEMO_OUTER_WEB.value==""){
		alert("请输入DEMO环境外部登陆页面");
		return;
	}
	if(form1.DEMO_CREATE_TIME.value==""){
		alert("请输入DEMO环境搭建时间");
		return;
	}
	if(form1.DEMO_STATUS.value==""){
		alert("请输入DEMO环境运行状态");
		return;
	}
	if(form1.DEMO_NOTE.value==""){
		alert("请输入DEMO信息备注");
		return;
	}
	if(form1.DEMO_APP_EDI.value==""){
		alert("请输入DEMO应用环境版本");
		return;
	}
	if(form1.DEMO_DB_EDI.value==""){
		alert("请输入DEMO数据库环境版本");
		return;
	}
	form1.submit();
}
function return_back(){
	window.location = "env_info_demo_query.jsp";
}
</script>
<script language="JavaScript" for="document" event="onkeypress">
	if(event.keyCode==13){
		check();
	}
</script>
</html>
