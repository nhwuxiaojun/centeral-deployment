<html>
<head>
<title>Welcome</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body><%@include file="includes/head.html" %>
<%
if(session.getAttribute("username")==null||"".equals(session.getAttribute("username"))){
	response.sendRedirect("../index_lan.jsp");
}
%>
<jsp:include page="includes/copyright.jsp" /></body>
</html>
