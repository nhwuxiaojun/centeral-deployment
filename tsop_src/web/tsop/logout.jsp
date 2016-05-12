<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page  import="ebao.DBean" %>
<html>
<head>
<title>logout</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
</head>

<body><%@include file="includes/head.html" %>
<%
session.invalidate();
response.sendRedirect("index.jsp");
%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
