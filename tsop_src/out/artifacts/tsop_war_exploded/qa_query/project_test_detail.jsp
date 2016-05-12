<%@ include file="../interface/check_qa.jsp"%>
<%@ page language="java" import="java.sql.ResultSet,java.sql.ResultSetMetaData" contentType="text/html; charset=gb2312" errorPage=""%>
<%@ page  import="ebao.QADBean" %>
<%@ page  import="ebao.Tools" %>
<html>
<head>
<title>项目测试详细</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/ebao.css" rel="stylesheet" type="text/css">
</head>
<%
QADBean db = new QADBean();
String sql = new String();
ResultSet rs;
sql = "select * from a_project_version_test where id = " + request.getParameter("id");
//out.print(sql+"<br>");
rs=db.execSQL(sql);
%>
<body>
<%while(rs.next()){%>
<div align="center"><font color="#FF6600"><strong><br>
  <span class="s105">项目外部测试用例执行情况（当天）</span></strong></font>
</div>
<br><br>
<table width="50%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="25%"><font color="#FF6600"><strong>项目名称</strong></font></td>
	  <td width="75%" align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getString("project_name")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="25%"><font color="#FF6600"><strong>项目版本</strong></font></td>
	  <td width="75%" align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getString("project_version")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="25%"><font color="#FF6600"><strong>客户名称</strong></font></td>
	  <td width="75%" align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getString("customer_name")%>&nbsp;</font></td>
	</tr>
</table>
<br>
<br>
<table width="50%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="25%"><font color="#FF6600"><strong>Failed</strong></font></td>
	  <td width="75%" align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getInt("fail_num")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="25%"><font color="#FF6600"><strong>Passed</strong></font></td>
	  <td width="75%" align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getInt("pass_num")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="25%"><font color="#FF6600"><strong>测试日期</strong></font></td>
	  <td width="75%" align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getDate("test_date")%>&nbsp;</font></td>
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
