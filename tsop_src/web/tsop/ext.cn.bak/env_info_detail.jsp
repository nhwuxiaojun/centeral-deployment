<%@ include file="../interface/check_non_ts.jsp"%>
<%@ page import="java.sql.ResultSet,java.sql.ResultSetMetaData" contentType="text/html; charset=gbk" errorPage=""%>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>

<%
DBean db = new DBean();
String sql = new String();
ResultSet rs;
//sql="select * from a_proj_env_svr where mac_ip='"+request.getParameter("mac_ip")+"' and env_ip='"+request.getParameter("env_ip")+"'";
sql = "select b.*, a.backup_type from a_apply a, a_proj_env_svr b where a.new_env(+) = b.proj_env and b.env_id = " + request.getParameter("id");
rs = db.execSQL(sql);
%>

<%while(rs.next()){%>
<html>
<head>
<title><%=rs.getString("PROJ_ENV")%>Ӧ�û�����Ϣ��ϸ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="../css/ebao_no_ts.css" rel="stylesheet" type="text/css">
</head>
<body><%@include file="includes/head.html" %>
<div align="center"><strong><br>
  <span class="s105"><%=rs.getString("PROJ_ENV")%>Ӧ�û�����Ϣ��ϸ</span></strong>
</div>
<br><br>
<table width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="left">
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#FF6600"><strong>����IP</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getString("ENV_IP")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#FF6600"><strong>WEB������·��</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getString("WEB_INST_PATH")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#FF6600"><strong>HTML�ļ�·��</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getString("HTML_PATH")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#FF6600"><strong>appServer���ư汾</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getString("APP_NAME")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#FF6600"><strong>appServerʵ��·��</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getString("APP_INST_PATH")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#FF6600"><strong>appServer�󶨶˿�</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getString("APP_PORT")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#FF6600"><strong>���ݿ�������Ϣ</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getString("DB_INFO")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#FF6600"><strong>���ݿ������û�</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getString("DB_USR")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#FF6600"><strong>���ݿ���������</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getString("DB_PWD")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#FF6600"><strong>���������û�</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getString("ENV_USR")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#FF6600"><strong>������������</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getString("ENV_PWD")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#FF6600"><strong>����̨�����û�</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getString("CON_USR")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#FF6600"><strong>����̨��������</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getString("CON_PWD")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#FF6600"><strong>FTP��½�û�</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getString("FTP_USR")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#FF6600"><strong>FTP��½����</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getString("FTP_PWD")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#FF6600"><strong>������Ŀ����</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getString("PROJ_GRP")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#FF6600"><strong>ҳ���½��ַ</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getString("PROJ_DNS")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#FF6600"><strong>����������</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getString("CREATER")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#FF6600"><strong>������������</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getDate("CRT_DATE")%>&nbsp;<%=rs.getTime("CRT_DATE")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#FF6600"><strong>����������</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getString("PROPOSER")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#FF6600"><strong>�Ƿ���Ҫ����</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=Tools.msNull(rs.getString("BACKUP_TYPE"))%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#FF6600"><strong>��������״̬</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getString("ENV_STATE")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#FF6600"><strong>��Ŀ����</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getString("PROJ_CODE")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#FF6600"><strong>Ӧ�ñ���Ŀ¼</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=Tools.msNull(rs.getString("BACKUP_DIR"))%>&nbsp;</font></td>
	</tr>
		<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#FF6600"><strong>DMS����</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=Tools.msNull(rs.getString("DMS_TYPE"))%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#FF6600"><strong>Print����</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=Tools.msNull(rs.getString("PRINT_TYPE"))%>&nbsp;</font></td>
	</tr>
	
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#FF6600"><strong>��ӡIP</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getString("print_ip")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#FF6600"><strong>��ӡ�û�</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getString("print_user")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#FF6600"><strong>��ӡ����</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=rs.getString("print_pwd")%>&nbsp;</font></td>
	</tr>
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="16%"><font color="#FF6600"><strong>��ӡĿ¼</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600">&nbsp;<%=Tools.msNull(rs.getString("print_dir"))%>&nbsp;</font></td>
	</tr>
	
	
	
	<tr>
	  <td align="center" bgcolor="#D2D2D2" class="en" width="20%"><font color="#FF6600"><strong>��ע</strong></font></td>
	  <td align="center" bgcolor="#FCFCFC" class="en"><font color="#FF6600"><textarea name="NOTE" cols="30" rows="5" readonly><%=Tools.msNull(rs.getString("NOTE"))%></textarea></font></td>
	</tr>
</table>
<%}%>
<jsp:include page="includes/copyright.jsp" /></body>
<%db.close();%>
<%rs.close();%>
</html>
