<%@ include file="../interface/check.jsp"%>
<%@ page language="java" import="java.sql.ResultSet,java.sql.ResultSetMetaData" contentType="text/html; charset=gbk" errorPage=""%>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<html>
<head>
<title>数据库信息详细</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<%
DBean db = new DBean();
String sql1 = new String();
String sql2 = new String();
int i = 0;
int j = 0;
sql1 = "insert into a_db_svr select a_db_svr_tmp.DB_IP,a_db_svr_tmp.OS_DB_USER,a_db_svr_tmp.OS_DB_PASSWD,a_db_svr_tmp.DB_SID,a_db_svr_tmp.DB_USER,a_db_svr_tmp.DB_USER_PASSWD,a_db_svr_tmp.DB_USER_TYPE,a_db_svr_tmp.PROJ_ENV,a_db_svr_tmp.PROJECT_GROUP,a_db_svr_tmp.PROPOSER,a_db_svr_tmp.CREATER,a_db_svr_tmp.CREATE_DATE,a_db_svr_tmp.DB_MANAGER,a_db_svr_tmp.DB_VERSION,a_db_svr_tmp.DB_CHARACTER,a_db_svr_tmp.DB_PORT_NUM,a_db_svr_tmp.DB_LISTENER,a_db_svr_tmp.DB_STATUS,a_db_svr_tmp.PROJ_CODE,s_db__id.nextval,a_db_svr_tmp.create_date,0,0,a_db_svr_tmp.apply_type from a_db_svr_tmp where db_id = " + request.getParameter("id");
//out.print(sql1 + "<br>");
i = db.execUpdate(sql1);
sql2 = "delete from a_db_svr_tmp where db_id = " + request.getParameter("id");
//out.print(sql2 + "<br>");
j = db.execUpdate(sql2);
%>
<body><%@include file="includes/head.html" %>
<%
if(i==1&&j==1){
	response.sendRedirect("db_server_confirm.jsp?info=确认成功！");
}else{
	response.sendRedirect("db_server_confirm.jsp?info=确认失败！");
}
%>
<jsp:include page="includes/copyright.jsp" /></body>
<%db.close();%>
</html>
