<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>��������ϸ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<%
DBean db = new DBean();
String sql = new String();
ResultSet rs;
sql="select * from a_supply where id = " + request.getParameter("id");
rs=db.execSQL(sql);
%>
<body><%@include file="includes/head.html" %>
<%while(rs.next()){%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">��������ϸ</span></strong></font>
</div>
<br><br>
<table width="70%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>�»�������</strong></font></td>
	  <td width="84%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("new_env")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>�����������</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("mac_ip")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td width="16%" height="23" align="center" bgcolor="#D2D2D2" class="en"><font color="#3333cc"><strong>Ӧ��ʹ��ip</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("env_ip")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>�������</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("env_creator")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>���ݿ������</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("db_ip")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>���ݿ�SID</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("db_sid")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>���ݿ���</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("db_creator")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>�����ύʱ��</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getDate("apply_time")%>&nbsp;<%=rs.getTime("apply_time")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>Ӧ���ύ״̬</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("env_status")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>���ݿ��ύ״̬</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("db_status")%>&nbsp;</font></td>
	</tr>
</table>
<%}%>
<jsp:include page="includes/copyright.jsp" /></body>
<%db.close();%>
<%rs.close();%>
</html>
