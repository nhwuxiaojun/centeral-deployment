<%@ include file="../interface/check.jsp"%>
<%@ page language="java" import="java.sql.ResultSet,java.sql.ResultSetMetaData" contentType="text/html; charset=gbk" errorPage=""%>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<html>
<head>
<title>���ݿ⻷����Ϣ��ϸ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<%
DBean db = new DBean();
String sql = new String();
ResultSet rs;
sql = "select * from a_ftp_info where ftp_id = " + request.getParameter("id");
rs = db.execSQL(sql);
%>
<body><%@include file="includes/head.html" %>
<%while(rs.next()){%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">���ݿ⻷����Ϣ��ϸ</span></strong></font>
</div>
<br>
<table width="70%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>��Ŀ��</strong></font></td>
	  <td width="79%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("PROJ_NAME")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>��Ŀ����</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("PROJ_CODE")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td width="21%" height="23" align="center" bgcolor="#D2D2D2" class="en"><font color="#3333cc"><strong>FTP�û�</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("USERNAME")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>FTP����</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("FTP_PASSWORD")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>FTP����</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("FTP_TYPE")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>FTPĿ¼</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("FTP_DIR")%>&nbsp;</font></td>
	</tr>
	




	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>��ʼʱ��</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getDate("START_TIME")%>&nbsp;</font></td>
	</tr>

	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>����ʱ��</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getDate("END_TIME")%>&nbsp;</font></td>
	</tr>

	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>����Ŀ��</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("PURPOSE")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>������</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("APPLICANT")%>&nbsp;</font></td>
	</tr>
	
	
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>ע��</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("COMMENTS")%>&nbsp;</font></td>
	</tr>
</table>
<%}%>
<br>
<center><button onclick="window.close()">Close</button></center>
<jsp:include page="includes/copyright.jsp" /></body>
<%db.close();%>
<%rs.close();%>
</html>
