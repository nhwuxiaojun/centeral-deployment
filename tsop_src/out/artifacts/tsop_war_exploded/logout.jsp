<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page  import="ebao.DBean" %>
<html>
<head>
<title>logout</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>
<%
session.invalidate();
response.sendRedirect("index.jsp");
%>
</body>
</html>
