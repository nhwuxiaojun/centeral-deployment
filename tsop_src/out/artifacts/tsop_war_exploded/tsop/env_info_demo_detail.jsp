<%@ include file="../interface/check.jsp"%>
<%@ page language="java" import="java.sql.ResultSet,java.sql.ResultSetMetaData" contentType="text/html; charset=gbk" errorPage=""%>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>DemoӦ�û�����Ϣ��ϸ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<%
DBean db = new DBean();
String sql = new String();
ResultSet rs;
sql = "select * from a_proj_demo_svr where id = " + request.getParameter("id");
rs = db.execSQL(sql);
%>
<body><%@include file="includes/head.html" %>
<%while(rs.next()){%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">DemoӦ�û�����Ϣ��ϸ</span></strong></font>
</div>
<br><br>
<table width="70%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>����ip</strong></font></td>
	  <td width="84%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("MAC_IP")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>������½��</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("OS_USR")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td width="16%" height="23" align="center" bgcolor="#D2D2D2" class="en"><font color="#3333cc"><strong>������½����</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("OS_PWD")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>��Ŀ������</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("PROJ_NAME")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>��Ŀ�����汾</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("PROJ_VER")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>�ļ���ŵ�ַ</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DEMO_LOC")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>����Ӧ��ip</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DEMO_APP_IP")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>DEMOӦ�û����汾</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DEMO_APP_EDI")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>�������ݿ�ip</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DEMO_DB_IP")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>DEMO���ݿ⻷���汾</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DEMO_DB_EDI")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>�����ڲ���½ҳ��</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DEMO_INTRA_WEB")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>�����ⲿ��½ҳ��</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DEMO_OUTER_WEB")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>DEMO��Ϣ��ע</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DEMO_NOTE")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>�����ʱ��</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getDate("DEMO_CREATE_TIME")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>DEMO �����Ǽ���</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DEMO_SIGNER")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>��������״̬</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DEMO_STATUS")%>&nbsp;</font></td>
	</tr>
</table>
<%}%>
<jsp:include page="includes/copyright.jsp" /></body>
<%db.close();%>
<%rs.close();%>
</html>
