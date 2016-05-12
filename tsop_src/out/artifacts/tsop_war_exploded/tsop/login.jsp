<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.ldap.LdapUserPassAutherticateProvider" %>
<html>
<head>
<title>login</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>

<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();
String sql = new String();
ResultSet rs;
sql = "select * from a_user where usr='" + request.getParameter("username").trim() + "' and (valid='1' or valid='2')";
//out.print(sql + "<br>");
rs = db.execSQL(sql);
while(rs.next()){
	LdapUserPassAutherticateProvider ldapUserPassAutherticateProvider = new LdapUserPassAutherticateProvider();
	//if("111111".equals(request.getParameter("password"))){
	if(ldapUserPassAutherticateProvider.doAuthenticate(request.getParameter("username"),request.getParameter("password"))==true){
		session.setAttribute("username",request.getParameter("username").trim());
		response.sendRedirect("interface/main3.jsp");
	}else{
		response.sendRedirect("index.jsp");
	}
}
response.sendRedirect("index.jsp");
db.close();
rs.close();
%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
