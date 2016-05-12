<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>Demo应用环境删除</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<%
DBean db = new DBean();
String sql = new String();
String demo_signer = new String();
ResultSet rs;
int i = 0;

sql = "select * from a_proj_demo_svr where id = " + request.getParameter("id");
rs = db.execSQL(sql);
while(rs.next()){
	demo_signer = rs.getString("DEMO_SIGNER");
}
if(demo_signer.equals(session.getAttribute("username"))){
	sql ="delete from a_proj_demo_svr where id = " + request.getParameter("id") + " and demo_signer = '" + session.getAttribute("username").toString() + "'";
	i = db.execUpdate(sql);
}
%>
<body><%@include file="includes/head.html" %>
<%
if(i==1){
	response.sendRedirect("env_info_demo_query.jsp?info=Delete Succeed!");
}else{
	response.sendRedirect("env_info_demo_query.jsp?info=Delete Failed!");
}
%>
<jsp:include page="includes/copyright.jsp" /></body>
<%db.close();%>
</html>
