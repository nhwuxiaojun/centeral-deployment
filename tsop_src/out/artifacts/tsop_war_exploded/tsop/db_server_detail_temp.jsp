<%@ include file="../interface/check.jsp"%>
<%@ page language="java" import="java.sql.ResultSet,java.sql.ResultSetMetaData" contentType="text/html; charset=gbk" errorPage=""%>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<html>
<head>
<title>���ݿ���Ϣ��ϸ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<%
DBean db = new DBean();
String sql = new String();
ResultSet rs;
sql = "select d.*,c.backup_type from a_apply c, a_db_svr_tmp d where c.new_env(+) = d.proj_env and d.db_id = " + request.getParameter("id");
rs = db.execSQL(sql);
%>
<body><%@include file="includes/head.html" %>
<%while(rs.next()){%>
<div align="center"><font color="#3333cc"><strong><br>
  <span class="s105">���ݿ���Ϣ��ϸ</span></strong></font>
</div>
<br><br>
<table width="70%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="23%"><font color="#3333cc"><strong>���ݿ�IP</strong></font></td>
	  <td width="77%" align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_IP")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="23%"><font color="#3333cc"><strong>��װ�û���</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("OS_DB_USER")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td width="23%" height="23" align="center" bgcolor="#D2D2D2" class="en"><font color="#3333cc"><strong>�û�����</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("OS_DB_PASSWD")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="23%"><font color="#3333cc"><strong>���ݿ�ʵ����</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_SID")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="23%"><font color="#3333cc"><strong>���ݿ��û�</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_USER")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="23%"><font color="#3333cc"><strong>���ݿ��û�����</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_USER_PASSWD")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="23%"><font color="#3333cc"><strong>���ݿ��û�����</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_USER_TYPE")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="23%"><font color="#3333cc"><strong>��Ŀ������</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("PROJ_ENV")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="23%"><font color="#3333cc"><strong>������Ŀ����</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("PROJECT_GROUP")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="23%"><font color="#3333cc"><strong>���ݿ⻷��������</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("PROPOSER")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="23%"><font color="#3333cc"><strong>���ݿ⻷��������</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("CREATER")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="23%"><font color="#3333cc"><strong>���ݿ⻷����������</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getDate("CREATE_DATE")%>&nbsp;<%=rs.getTime("CREATE_DATE")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="23%"><font color="#3333cc"><strong>���ݿ⸺����</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_MANAGER")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="23%"><font color="#3333cc"><strong>���ݿ�汾</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_VERSION")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="23%"><font color="#3333cc"><strong>���ݿ��ַ���</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_CHARACTER")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="23%"><font color="#3333cc"><strong>���ݿ�˿ں�</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_PORT_NUM")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="23%"><font color="#3333cc"><strong>���ݿ������</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_LISTENER")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="21%"><font color="#3333cc"><strong>�Ƿ���Ҫ����</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("BACKUP_TYPE")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="23%"><font color="#3333cc"><strong>���ݿ�����״̬</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getString("DB_STATUS")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="23%"><font color="#3333cc"><strong>��Ŀ����</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#3333cc">&nbsp;<%=rs.getInt("PROJ_CODE")%>&nbsp;</font></td>
	</tr>
</table>
<%}%>
<jsp:include page="includes/copyright.jsp" /></body>
<%db.close();%>
<%rs.close();%>
</html>
