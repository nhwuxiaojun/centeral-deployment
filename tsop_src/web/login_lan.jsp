<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page  import="ebao.LANDBean" %>
<html>
<head>
<title>login</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>
<%
LANDBean db = new LANDBean();
String sql = new String();
ResultSet rs;
sql="select * from a_lanadmin_user where user_id = '" + request.getParameter("username").trim() + "' and password='" + request.getParameter("password").trim() + "' and (valid='1' or valid='2')";
//out.print(sql+"<br>");
rs=db.execSQL(sql);
while(rs.next()){
	session.setAttribute("username",request.getParameter("username").trim());
	response.sendRedirect("interface_lan/main1.jsp");
}
response.sendRedirect("index_lan.jsp");
db.close();
rs.close();
%>
</body>
</html>