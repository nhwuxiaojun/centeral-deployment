<%@ include file="../interface/check_qa.jsp"%>
<%@ page contentType="text/html; charset=gb2312" import="java.sql.*" errorPage="" %>
<%@ page  import="ebao.QADBean" %>
<%@ page  import="ebao.Tools" %>
<html>
<head>
<title>项目版本信息修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/ebao.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.text
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
.STYLE1 {color: #FF6600}
-->
</style>
</head>
<%
QADBean db = new QADBean();
String sql = new String();
String sql_user = new String();
ResultSet rs_user;
sql_user = "select * from a_qa_user where usr = '" + session.getAttribute("username") + "'";
rs_user=db.execSQL(sql_user);
while(rs_user.next()){
	if("2".equals(rs_user.getString("valid"))){
		rs_user.close();
		response.sendRedirect("../index_qa.jsp");
	}
}
ResultSet rs;
sql = "select * from a_project_version_info where project_name = '" + Tools.toGB(request.getParameter("project_name")) + "' and project_version = '" + Tools.toGB(request.getParameter("project_version")) + "'";
rs=db.execSQL(sql);
%>
<script language="javascript">
function check(){
	if(form1.uat_start_date.value==""){
		alert("请输入UAT开始日期");
		return;
	}
	if(form1.production_start_date.value==""){
		alert("请输入Production开始日期");
		return;
	}
	form1.submit();
}
</script>
<script src="calendar.js" language="javascript" type="text/javascript"></script>
<body>
<form name="form1" action="project_version_update_finish.jsp" method="post">
<%while(rs.next()){%>
<div align="center"><font color="#FF6600"><strong><br>
  <span class="s105">项目版本信息修改</span></strong></font>
</div>
<br><br>
<table width="70%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
  <tr> 
    <td width="25%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>项目名称：</strong></td>
    <td class="en" width="60%" align="center"><%=rs.getString("project_name")%></td>
	<input type="hidden" name="project_name" value="<%=rs.getString("project_name")%>">
  </tr>
  <tr> 
    <td width="25%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>项目版本：</strong></td>
    <td width="60%" align="center" class="en"><%=rs.getString("project_version")%></td>
	<input type="hidden" name="project_version" value="<%=rs.getString("project_version")%>">
  </tr>
  <tr> 
    <td width="25%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>UAT开始日期：</strong></td>
    <td width="60%" align="center" class="en"><input type="text" name="uat_start_date" value="<%=rs.getDate("uat_start_date")%>" class="text" size="25" onFocus="show_cele_date(uat_start_date,'','',uat_start_date)"></td>
  </tr>
  <tr> 
    <td width="25%" bgcolor="#D2D2D2" class="STYLE1 en"><strong>Production开始日期：</strong></td>
    <td width="60%" align="center" class="en"><input type="text" name="production_start_date" value="<%=rs.getDate("production_start_date")%>" class="text" size="25" onFocus="show_cele_date(production_start_date,'','',production_start_date)"></td>
  </tr>
</table>
<br>
<div align="center"><input type="button" name="button1" value="修改" onClick="check()" class="button1">&nbsp;&nbsp;<input type="reset" name="reset1" value="重置" class="button1"></div>
<%}%>
</form>
</body>
<%db.close();%>
<%rs.close();%>
</html>