<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.ldap.LdapUserPassAutherticateProvider" %>
<html>
<head>
<title>Welcome</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body><%@include file="includes/head.html" %>
<%

DBean db_check = new DBean();
String sql_check = new String();
ResultSet rs_check;
 
   String domainUserNameCheck = request.getRemoteUser().toLowerCase().toString();
//String domainUserNameCheck = "ebaotech\\Keen.wang@ebaotech.com";
  int slashIndex1 = domainUserNameCheck.indexOf("\\");
  if (domainUserNameCheck != null&&slashIndex1 != -1) {
	domainUserNameCheck = domainUserNameCheck.substring(slashIndex1 + 1);
  }
  int slashIndex2 = domainUserNameCheck.indexOf("@");
  if (domainUserNameCheck != null&&slashIndex2 != -1) {
	  domainUserNameCheck = domainUserNameCheck.substring(0,slashIndex2);
   }
   sql_check ="select count(*) from a_user_ext where lower(usr)='" + domainUserNameCheck.trim() + "' ";
	rs_check = db_check.execSQL(sql_check);
	int rs_size_check=0;  
	//if(rs_size_check>0){
	
	 while(rs_check.next()){
	    rs_size_check=rs_check.getInt(1);
	       
	 }  
	if(rs_size_check>0){
	    if(session.getAttribute("ext_username")==null||"".equals(session.getAttribute("ext_username"))){
		    session.setAttribute("ext_username",domainUserNameCheck.trim());
	     }
	 }else{
	   response.sendRedirect("../no_auth.jsp");
	 }
	 
	db_check.close();
	rs_check.close();


%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
