<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.ldap.LdapUserPassAutherticateProvider" %>
<html>
<head>
<title>login</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>

<body>
<%
DBean db = new DBean();
String sql = new String();
ResultSet rs;
String domainUserName = request.getRemoteUser().toLowerCase().toString();
//String domainUserName = "ebaotech\\Keen.wang@ebaotech.com";
System.out.println(domainUserName);
int slashIndex1 = domainUserName.indexOf("\\");
if (domainUserName != null&&slashIndex1 != -1) {
	domainUserName = domainUserName.substring(slashIndex1 + 1);
}
int slashIndex2 = domainUserName.indexOf("@");
if (domainUserName != null&&slashIndex2 != -1) {
	domainUserName = domainUserName.substring(0,slashIndex2);
}


System.out.println("------TS user------"+domainUserName);

//response.sendRedirect("index.jsp");
db.close();
%>
</body>
</html>
