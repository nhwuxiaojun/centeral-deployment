<%@ include file="./interface/check_ext.jsp"%>
<%@ page import="java.sql.ResultSet,java.sql.ResultSetMetaData" contentType="text/html; charset=gbk" errorPage=""%>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<html>
<head>
<title>数据库登陆权限删除</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="css/ebao.css" rel="stylesheet" type="text/css">
</head>
<%
DBean db = new DBean();
String sql = new String();
String path = new String();
String shell = new String();
int delcount = 0;
int j = 0;
delcount = Integer.parseInt(request.getParameter("delcount"));
String[] temp_dir = new String[4];
for(int i=0;i<delcount;i++){
	if("".equals(request.getParameter("del_" + i))||request.getParameter("del_" + i)==null){
		
	}else{
		temp_dir = request.getParameter("del_" + i).split("/");
		sql = "delete from a_login_control where login_ip = '" + temp_dir[0] + "' and login_os_user = '" + temp_dir[1] + "' and login_db_user = '" + temp_dir[2] + "' and login_db_sid = '" + temp_dir[3] + "'";
		//out.print(sql + "<br>");
		j = db.execUpdate(sql);
	}
}
%>
<body><%@include file="includes/head.html" %>
<%
if(j==1){
	response.sendRedirect("ext_db_privi_query.jsp?info=回收成功！");
}else{
	response.sendRedirect("ext_db_privi_query.jsp?info=回收失败！");
}
%>
<jsp:include page="includes/copyright.jsp" /></body>
<%db.close();%>
</html>
