<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<html>
<head>
<title>数据库表提交</title>
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
<%
DBean db = new DBean();
ResultSet rs1;
String sql1 = new String();

String username=(String)session.getAttribute("username");

sql1="select * from a_supply where id = " + request.getParameter("id");
rs1=db.execSQL(sql1);
while(rs1.next()){

%>


<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">数据库表提交</span></strong></font>
</div>
<form name="form1" action="db_info_submit_finish.jsp" method="post" class="en">
<table width="80%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">

  <tr> 
    <td width="34%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>环境名：</strong></td>
    <td class="en" width="66%"><input type="text" name="PROJ_ENV" value="<%=rs1.getString("new_env")%>"  readonly="true" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="34%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DB IP</strong></td>
    <td class="en" width="66%"><input type="text" name="DB_IP" value="<%=rs1.getString("db_ip")%>" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="34%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DB SID</strong></td>
    <td class="en" width="66%"><input type="text" name="DB_SID" value="<%=rs1.getString("db_sid")%>" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="34%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>DB LDAP NAME</strong></td>
    <td class="en" width="66%"><input type="text" name="DB_LDAP_NAME" value="<%=rs1.getString("db_ldap_name")%>" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="34%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>环境owner用户：</strong></td>
    <td class="en" width="66%"><input type="text" name="ENV_OWNER" value="<%=rs1.getString("owner_name")%>" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="34%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>环境owner用户密码：</strong></td>
    <td class="en" width="66%"><input type="text" name="ENV_OWNER_PASSWORD" value="<%=rs1.getString("owner_name")+"pwd"%>" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="34%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>环境app用户：</strong></td>
    <td class="en" width="66%"><input type="text" name="ENV_APP" value="<%=rs1.getString("owner_name")+"_app"%>" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="34%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>环境app用户密码：</strong></td>
    <td class="en" width="66%"><input type="text" name="ENV_APP_PASSWORD" value="<%=rs1.getString("owner_name")+"_app_only"%>" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="34%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>环境read用户：</strong></td>
    <td class="en" width="66%"><input type="text" name="ENV_READ" value="<%=rs1.getString("owner_name")+"_read"%>" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="34%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>环境read用户密码：</strong></td>
    <td class="en" width="66%"><input type="text" name="ENV_READ_PASSWORD" value="<%=rs1.getString("owner_name")+"_read_only"%>" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="34%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>环境oper用户：</strong></td>
    <td class="en" width="66%"><input type="text" name="ENV_OPER" value="<%=rs1.getString("owner_name")+"_oper"%>" class="en" size="35"></td>
  </tr>
  <tr> 
    <td width="34%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>环境oper用户密码：</strong></td>
    <td class="en" width="66%"><input type="text" name="ENV_OPER_PASSWORD" value="<%=rs1.getString("owner_name")+"_app_only"%>" class="en" size="35"></td>
  </tr>
  <!--<tr> 
    <td width="34%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>数据库环境创建日期：</strong></td>
    <td class="en" width="66%"><input type="text" name="CRT_DATE" value="" class="en" size="35" onFocus="show_cele_date(CRT_DATE,'','',CRT_DATE)"></td>
  </tr>
  <tr> 
    <td width="34%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>环境负责人：</strong></td>
    <td class="en" width="66%"><input type="text" name="DB_MANAGER" value="<%=username%>" class="en" size="35"></td>
  </tr>
-->
  <tr> 
    <td width="22%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>是否邮件通知：</strong></td>
    <td width="78%" class="en">
	<input type="checkbox" name="send_email" checked="checked" value="1">
	</td>
  </tr>
</table>
<br>
<div align="center">
<input type="button" name="button1" value="提交" onClick="check()">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="reset1" value="重置">
</div>
</form>
<%
}
db.close();
rs1.close();

%>
</body>
<script language="JavaScript">
function check(){
	if(form1.PROJ_ENV.value==""){
		alert("请输入项目环境名");
		return;
	}
	if(form1.ENV_OWNER.value==""){
		alert("请输入环境owner用户");
		return;
	}
	if(form1.ENV_OWNER_PASSWORD.value==""){
		alert("请输入环境owner用户密码");
		return;
	}
	/*
	if(form1.CRT_DATE.value==""){
		alert("请输入数据库环境创建日期");
		return;
	}
	if(form1.DB_MANAGER.value==""){
		alert("请输入环境负责人");
		return;
	}
	*/
	form1.submit();
}
</script>
<script language="JavaScript" for="document" event="onkeypress">
	if(event.keyCode==13){
		check();
	}
</script>
</html>
