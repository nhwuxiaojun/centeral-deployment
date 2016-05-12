<%@ include file="../interface/check_qa.jsp"%>
<%@ page language="java" import="java.sql.ResultSet,java.sql.ResultSetMetaData" contentType="text/html; charset=gb2312" errorPage=""%>
<%@ page  import="ebao.QADBean" %>
<%@ page  import="ebao.Tools" %>
<html>
<head>
<title>项目版本信息详细</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/ebao.css" rel="stylesheet" type="text/css">
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
//out.print(sql+"<br>");
rs=db.execSQL(sql);
%>
<body>
<%while(rs.next()){%>
<div align="center"><font color="#FF6600"><strong><br>
  <span class="s105">项目版本信息详细</span></strong></font>
</div>
<br><br>
<table width="70%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="25%"><font color="#FF6600"><strong>项目名称</strong></font></td>
	  <td width="75%" align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getString("project_name")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="25%"><font color="#FF6600"><strong>项目版本</strong></font></td>
	  <td width="75%" align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getString("project_version")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="25%"><font color="#FF6600"><strong>UAT开始日期</strong></font></td>
	  <td width="75%" align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getDate("uat_start_date")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="25%"><font color="#FF6600"><strong>Production开始日期</strong></font></td>
	  <td width="75%" align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getDate("production_start_date")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="25%"><font color="#FF6600"><strong>提交人</strong></font></td>
	  <td width="75%" align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getString("user_name")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="25%"><font color="#FF6600"><strong>提交日期</strong></font></td>
	  <td width="75%" align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getDate("submit_datetime")%>&nbsp;</font></td>
	</tr>
</table>
<%}%>
</body>
<%db.close();%>
<%rs.close();%>
</html>
