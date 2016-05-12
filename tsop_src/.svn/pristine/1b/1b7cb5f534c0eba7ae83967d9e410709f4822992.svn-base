<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.util.Date" %>
<html>
<head>
<title>环境搭建流程修改处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>

<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();
String sql = new String();

int i = 0;
String id = new String();
String proj_grp = new String();
String sys_ver = new String();
String app_soft = new String();
String db_version = new String();
String proj_proposer = new String();
String new_env = new String();

id = request.getParameter("id");
proj_grp = request.getParameter("proj_grp");
sys_ver = request.getParameter("sys_ver");
app_soft = request.getParameter("app_soft");
db_version = request.getParameter("db_version");
proj_proposer = request.getParameter("proj_proposer");
new_env=request.getParameter("new_env");

sql = "update a_apply set proj_grp = '" + request.getParameter("proj_grp") + "',new_env = '" + new_env +"',sys_ver = '" + request.getParameter("sys_ver") + "',app_soft = '" + request.getParameter("app_soft") + "',db_version = '" + request.getParameter("db_version") + "',proj_proposer = '" + request.getParameter("proj_proposer") + "' where id = " + id;

//out.println(sql + "<br>");

i = db.execUpdate(sql);

//out.println(i + "<br>");
db.close();
if(i==1){
	response.sendRedirect("project_build_manage.jsp?info=Update Succeed!");
}else{
	response.sendRedirect("project_build_manage.jsp?info=Update Failed!");
}
%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
