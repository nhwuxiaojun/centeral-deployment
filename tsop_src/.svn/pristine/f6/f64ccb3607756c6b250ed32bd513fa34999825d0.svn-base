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
String domainUserName = request.getRemoteUser().toLowerCase().toString();
//String domainUserName = "ebaotech\\Keen.wang@ebaotech.com";
//System.out.println(domainUserName);
int slashIndex1 = domainUserName.indexOf("\\");
if (domainUserName != null&&slashIndex1 != -1) {
	domainUserName = domainUserName.substring(slashIndex1 + 1);
}
int slashIndex2 = domainUserName.indexOf("@");
if (domainUserName != null&&slashIndex2 != -1) {
	domainUserName = domainUserName.substring(0,slashIndex2);
}
sql = "select * from a_user_ext where usr='" + domainUserName.trim() + "' ";
//System.out.println(sql);
rs = db.execSQL(sql);
while(rs.next()){
	LdapUserPassAutherticateProvider ldapUserPassAutherticateProvider = new LdapUserPassAutherticateProvider();
	//if("111111".equals(request.getParameter("password"))){
	//if(ldapUserPassAutherticateProvider.doAuthenticate(request.getParameter("username"),request.getParameter("password"))==true){
		session.setAttribute("ext_username",domainUserName.trim());
		response.sendRedirect("interface/main_external.jsp");
	//}else{
		//response.sendRedirect("index.jsp");
	//}
}
//response.sendRedirect("index.jsp");
db.close();
rs.close();
%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
