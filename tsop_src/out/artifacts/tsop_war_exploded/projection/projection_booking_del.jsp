<%@ page import="java.sql.ResultSet" contentType="text/html; charset=gb2312" errorPage=""%>
<%@ page import="java.util.Date" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>Cancel Booking</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body>
<%
DBean db = new DBean();
int flag=0;
String sql = new String();
sql="delete from a_projection_booking where id="+request.getParameter("id");
flag=db.execUpdate(sql);
if(flag==1){
	response.sendRedirect("projection_booking_view_upd.jsp?msg=Cancel your booking successfully!");
}else{
	response.sendRedirect("projection_booking_view_upd.jsp?msg=Cancel your booking failure!");
}
%>
</body>
<%db.close();%>
</html>