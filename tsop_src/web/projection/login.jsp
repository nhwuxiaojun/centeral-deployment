<%@ page contentType="text/html; charset=gb2312" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>后台登陆</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="/ebao.css" rel="stylesheet" type="text/css">
</head>
<%
if("admin".equals(request.getParameter("username"))&&"admin".equals(request.getParameter("password"))){
	response.sendRedirect("projection_booking_view_upd.jsp");
}
%>
<body>
<center>
<br><br><br><br>
<font class="en"><strong><font color="#FF6600" size="+2">投影仪预定后台管理</font></strong></font>
<br><br><br><br>
<form name="form1" action="" method="post">
<font class="en"><strong><font color="#FF6600"> 用户名：</font></strong></font>
<input type="text" name="username" value="">
<font class="en"><strong><font color="#FF6600"> 密码：</font></strong></font>
<input type="password" name="password" value="">
<input type="submit" name="submit1" value="登陆">
</form>
</center>
</body>
</html>
