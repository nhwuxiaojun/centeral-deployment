<%@ include file="../interface/check.jsp"%>
<%@ page language="java" import="java.sql.ResultSet,java.sql.ResultSetMetaData" contentType="text/html; charset=gbk" errorPage=""%>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<%@ page  import="ebao.Tools" %>
<html>
<head>
<title>现场备份检查确认表删除</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<%
DBean db = new DBean();
String sql = new String();
String sql_temp = new String();
int i = 0;
int k = 0;
sql_temp = "delete from a_env_bak where project_name = '" + Tools.toGB(request.getParameter("project_name")) + "'";
k = db.execUpdate(sql_temp);
sql = "delete from a_pro_bak where project_name = '" + Tools.toGB(request.getParameter("project_name")) + "'";
i = db.execUpdate(sql);
%>
<body><%@include file="includes/head.html" %>
<%
if(i==1&&k==1){
	response.sendRedirect("scene_backup_check_manage.jsp?info=Delete Succeed!");
}else{
	response.sendRedirect("scene_backup_check_manage.jsp?info=Delete Failed!");
}
%>
<jsp:include page="includes/copyright.jsp" /></body>
<%db.close();%>
</html>
