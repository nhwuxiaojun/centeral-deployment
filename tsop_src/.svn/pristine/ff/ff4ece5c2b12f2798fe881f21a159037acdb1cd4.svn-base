<%@ include file="../interface/check.jsp"%>
<%@ page language="java" import="java.sql.ResultSet,java.sql.ResultSetMetaData" contentType="text/html; charset=gbk" errorPage=""%>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<html>
<head>
<title>应用环境信息删除</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<%
DBean db = new DBean();
String sql = new String();
int i=0;
sql="delete from a_db_svr_tmp where db_id = " + request.getParameter("id");
i=db.execUpdate(sql);
%>
<body><%@include file="includes/head.html" %>
<%
if(i==1){
	response.sendRedirect("db_server_confirm.jsp?info=Delete Succeed!");
}else{
	response.sendRedirect("db_server_confirm.jsp?info=Delete Failed!");
}
%>
<jsp:include page="includes/copyright.jsp" /></body>
<%db.close();%>
</html>
