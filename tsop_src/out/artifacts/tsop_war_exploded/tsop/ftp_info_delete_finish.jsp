<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="java.util.Date" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.util.*,javax.mail.*,javax.mail.internet.*,javax.activation.*" %>
<html>
<head>
<title>Delete finish</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();
int i = 0;
String sql = new String();
String sql_temp = new String();
ResultSet rs = null;
String ftp_id=new String();
String error_info=new String();

ftp_id = request.getParameter("ftp_id").trim();
sql = "delete from a_ftp_info where ftp_id="+ ftp_id;
System.out.print(sql);
    try {
	i = db.execUpdate(sql);
    } catch (Exception e) {  
        e.printStackTrace();
	error_info=e.toString();
    }
if(i==1){
	response.sendRedirect("ftp_info_query.jsp?info=Delete Succeed!");
//out.println("<script>alert('FTP Account create Succeed!');window.close();</Script>"); 	
}else{
	response.sendRedirect("ftp_info_query.jsp?info=Delete Failed!<br>"+error_info);
//	out.println(error_info);	
//	out.println("<button onClick=javascript: history.go(-1)>");	
}
%>
<%
db.close();
rs.close();
%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
