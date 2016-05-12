<%@ include file="../interface/check.jsp"%>
<%@ page language="java" import="java.sql.ResultSet,java.sql.ResultSetMetaData" contentType="text/html; charset=gbk" errorPage=""%>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<html>
<head>
<title>服务器Dome环境删除</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<%
DBean db = new DBean();
String sql = new String();
int i = 0;
sql = "delete from a_proj_env_svr where env_id = " + request.getParameter("id");
i = db.execUpdate(sql);
%>
<body><%@include file="includes/head.html" %>
<%
if(i==1){
	response.sendRedirect("demo_server_env_list.jsp?info=Delete Succeed!");
}else{
	response.sendRedirect("demo_server_env_list.jsp?info=Delete Failed!");
}
%>
<jsp:include page="includes/copyright.jsp" /></body>
<%db.close();%>
</html>
