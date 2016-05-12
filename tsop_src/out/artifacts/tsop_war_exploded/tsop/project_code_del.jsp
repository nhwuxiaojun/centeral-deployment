<%@ include file="../interface/check.jsp"%>
<%@ page language="java" import="java.sql.ResultSet,java.sql.ResultSetMetaData" contentType="text/html; charset=gbk" errorPage=""%>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<html>
<head>
<title>项目代码删除</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<%
DBean db = new DBean();
String sql = new String();
String error_msg=new String();
int i = 0;
sql = "delete from ts_proj where proj_name = '" + request.getParameter("proj_name") + "'";
System.out.println(session.getAttribute("username")+":"+sql);
try {
  i = db.execUpdate(sql);
} catch (Exception e) {
	e.printStackTrace();
	error_msg=e.toString();
}
//sql = "update a_env_name set valid_flag = 0 where proj_name = '" + request.getParameter("proj_name") + "'";
//i = db.execUpdate(sql);
%>
<body><%@include file="includes/head.html" %>
<%
if(i==1){
	response.sendRedirect("project_code_manage.jsp?info=Delete Succeed!");
}else{
	response.sendRedirect("project_code_manage.jsp?info=Delete Failed!<br>"+error_msg);
}
%>
<jsp:include page="includes/copyright.jsp" /></body>
<%db.close();%>
</html>
