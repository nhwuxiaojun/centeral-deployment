<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<html>
<head>
<title>Demo环境表提交</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.STYLE1 {color: #3333cc}
-->
</style>
</head>
<script src="calendar2.js" language="javascript" type="text/javascript"></script>
<body><%@include file="includes/head.html" %>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">Demo环境表提交</span></strong></font>
</div>
<form name="form1" action="env_info_demo_add_finish.jsp" method="post" class="en">
<table width="80%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO主机ip</strong></td>
    <td class="en" width="63%"><input type="text" name="MAC_IP" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO主机登陆名</strong></td>
    <td class="en" width="63%"><input type="text" name="OS_USR" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO主机登陆密码</strong></td>
    <td class="en" width="63%"><input type="text" name="OS_PWD" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO项目环境名</strong></td>
    <td class="en" width="63%"><input type="text" name="PROJ_NAME" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO项目环境版本</strong></td>
    <td class="en" width="63%"><input type="text" name="PROJ_VER" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO文件存放地址</strong></td>
    <td class="en" width="63%"><input type="text" name="DEMO_LOC" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO环境应用ip</strong></td>
    <td class="en" width="63%"><input type="text" name="DEMO_APP_IP" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO环境数据库ip</strong></td>
    <td class="en" width="63%"><input type="text" name="DEMO_DB_IP" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO环境内部登陆页面</strong></td>
    <td class="en" width="63%"><input type="text" name="DEMO_INTRA_WEB" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO环境外部登陆页面</strong></td>
    <td class="en" width="63%"><input type="text" name="DEMO_OUTER_WEB" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO环境搭建时间</strong></td>
    <td class="en" width="63%"><input type="text" name="DEMO_CREATE_TIME" value="" class="en" size="35" onFocus="show_cele_date(DEMO_CREATE_TIME,'','',DEMO_CREATE_TIME)"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO环境运行状态</strong></td>
    <td class="en" width="63%"><input type="text" name="DEMO_STATUS" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO环境登记人</strong></td>
    <td class="en" width="63%"><input type="text" name="DEMO_SIGNER" value="<%=session.getAttribute("username").toString()%>" readonly class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO信息备注</strong></td>
    <td class="en" width="63%"><input type="text" name="DEMO_NOTE" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="37%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO应用环境版本</strong></td>
    <td class="en" width="63%"><input type="text" name="DEMO_APP_EDI" value="" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DEMO数据库环境版本：</strong></td>
    <td class="en" width="63%"><input type="text" name="DEMO_DB_EDI" value="" class="en" size="35"></td>
  </tr>
</table>
<br>
<div align="center">
<input type="button" name="button1" value="提交" onClick="check()">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="reset1" value="重置">
</div>
</form>
</body>
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
	if(form1.DEMO_SIGNER.value==""){
		alert("请输入DEMO环境登记人");
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
</script>
<script language="JavaScript" for="document" event="onkeypress">
	if(event.keyCode==13){
		check();
	}
</script>
</html>
