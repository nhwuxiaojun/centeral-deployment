<html>
<head>
<title>Welcome</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>
<%
if(session.getAttribute("username")==null||"".equals(session.getAttribute("username"))){
	response.sendRedirect("../index_boo.jsp");
}
%>
</body>
</html>
