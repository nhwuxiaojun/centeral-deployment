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
	if (domainUserName != null && slashIndex1 != -1) {
		domainUserName = domainUserName.substring(slashIndex1 + 1);
	}
	int slashIndex2 = domainUserName.indexOf("@");
	if (domainUserName != null && slashIndex2 != -1) {
		domainUserName = domainUserName.substring(0, slashIndex2);
	}


	System.out.println("------TS user------" + domainUserName);
	sql = "select * from a_user where usr='" + domainUserName.trim() + "' and (valid='1' or valid='2')";
	System.out.println(sql);
	rs = db.execSQL(sql);
//rs.last(); 

//rs.beforeFirst(); 

	while (rs.next()) {
		LdapUserPassAutherticateProvider ldapUserPassAutherticateProvider = new LdapUserPassAutherticateProvider();
		//if("111111".equals(request.getParameter("password"))){
		//if(ldapUserPassAutherticateProvider.doAuthenticate(request.getParameter("username"),request.getParameter("password"))==true){
		int rowCount = rs.getRow();
		if (rowCount == 1) {
			session.setAttribute("username", domainUserName.trim());
			response.sendRedirect("new.env_info_query.jsp");
		}
		//}else{
		//response.sendRedirect("index.jsp");
		//}
	}
	System.out.println("------Non-TS user------");
	sql = "select * from a_user where usr='" + domainUserName.trim() + "' and (valid='3')";
	System.out.println(sql);
	rs = db.execSQL(sql);
	while (rs.next()) {
		LdapUserPassAutherticateProvider ldapUserPassAutherticateProvider = new LdapUserPassAutherticateProvider();
		//if("111111".equals(request.getParameter("password"))){
		//if(ldapUserPassAutherticateProvider.doAuthenticate(request.getParameter("username"),request.getParameter("password"))==true){
		int rowCount = rs.getRow();
		if (rowCount == 1) {
			session.setAttribute("username", domainUserName.trim());
			response.sendRedirect("ext/index.jsp");
		}
	}


//response.sendRedirect("index.jsp");
	db.close();
	rs.close();
%>
</body>
</html>
