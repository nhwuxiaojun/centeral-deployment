<%@ include file="../interface/check.jsp"%>
<%@ page contentType="text/html; charset=gbk" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*,javax.mail.*,javax.mail.internet.*,javax.activation.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.io.*" %>
<html>
<head>
<title>证书修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>
<body><%@include file="includes/head.html" %>
<%
DBean db = new DBean();
String sql = new String();
String usr = new String();
String certificate = new String();
int i = 0;
usr = request.getParameter("usr");
certificate = Tools.toGB(request.getParameter("certificate").trim());

sql = "update a_user set certificate = '" + certificate + "' where usr = '" + usr + "'";
//out.println(sql + "<br>");
i = db.execUpdate(sql);
//out.println(i + "<br>");
db.close();
if(i==1){
	response.sendRedirect("certificate_do.jsp?info=Update Succeed!");
}else{
	response.sendRedirect("certificate_do.jsp?info=Update Failed!");
}
%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
