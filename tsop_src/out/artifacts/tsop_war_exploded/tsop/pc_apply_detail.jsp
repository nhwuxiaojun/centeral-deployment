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
sql = "select * from a_pc_apply where apply_id = " + request.getParameter("apply_id");
rs=db.execSQL(sql);
%>
<body><%@include file="includes/head.html" %>
<%while(rs.next()){%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">PC/WM������ϸ</span></strong></font>
</div>
<br><br>
<table width="70%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>��Ŀ����</strong></font></td>
	  <td width="84%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("proj_name")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>ϵͳƽ̨</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("sys_type")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td width="16%" height="23" align="center" bgcolor="#D2D2D2" class="en"><font color="#3333cc"><strong>������</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("proj_proposer")%>&nbsp;</font></td>
	</tr>
		<tr>
	  <td width="16%" height="23" align="center" bgcolor="#D2D2D2" class="en"><font color="#3333cc"><strong>TS Owner</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("ts_owner")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>�ڴ��С</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("mem_size")%>G&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>���̴�С</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("disk_size")%>G&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>�����ύʱ��</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("apply_time")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>����״̬</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("status")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>�����ύʱ��</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getDate("apply_time")%>&nbsp;<%=rs.getTime("apply_time")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>��Ŀ����</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("proj_code")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>��;</strong></font></td>
	  <td width="78%" class="en">
	     <textarea name="purpose" cols="56" rows="3"  readonly="true"><%=rs.getString("purpose")%></textarea>
	</td>
	</tr>
		<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#3333cc"><strong>��ע</strong></font></td>
	  <td width="78%" class="en">
	     <textarea name="purpose" cols="56" rows="3"   readonly="true"><%=rs.getString("note")%></textarea>
	</td>
	</tr>
	
</table>
<%}%>
<jsp:include page="includes/copyright.jsp" /></body>
<%db.close();%>
<%rs.close();%>
</html>
