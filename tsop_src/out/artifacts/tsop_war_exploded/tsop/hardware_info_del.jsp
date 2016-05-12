<%@ include file="../interface/check.jsp"%>
<%@ page language="java" import="java.sql.ResultSet,java.sql.ResultSetMetaData" contentType="text/html; charset=gbk" errorPage=""%>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<html>
<head>
<title>服务器硬件信息删除</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<%
DBean db = new DBean();
String sql = new String();
String mac_ip = new String();
String host_name = new String();
String[] temp_dir = new String[5];
int i = 0;
//out.print(request.getParameter("hardware_num") + "<br>");
temp_dir = request.getParameter("hardware_num").split("@");
//out.print(temp_dir[0] + "<br>");
///out.print(temp_dir[1] + "<br>");
mac_ip = temp_dir[0];
host_name = temp_dir[1];
sql = "delete from a_hardware where mac_ip = '" + mac_ip + "' and host_name = '" + host_name + "'";
//out.print(sql);
i = db.execUpdate(sql);
%>
<body><%@include file="includes/head.html" %>
<%
if(i==1){
	response.sendRedirect("hardware_info_query.jsp?info=Delete Succeed!");
}else{
	response.sendRedirect("hardware_info_query.jsp?info=Delete Failed!");
}
%>
<jsp:include page="includes/copyright.jsp" /></body>
<%db.close();%>
</html>
