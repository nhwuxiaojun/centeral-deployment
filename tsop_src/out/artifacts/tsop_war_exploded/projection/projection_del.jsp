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
//check password
String sql2 = new String();
String updpassword = new String();
updpassword = request.getParameter("updpassword");
String updpassword2 = new String();
ResultSet rs1;
sql2 = "select * from a_projection_booking where id="+request.getParameter("id");
rs1=db.execSQL(sql2);
while(rs1.next()){
	updpassword2 = rs1.getString("updpassword");
}
rs1.close();
out.print(updpassword + "<br>");
out.print(updpassword2 + "<br>");
if(!updpassword.equals(updpassword2)){
	response.sendRedirect("projection_booking_view.jsp?msg=your password is wrong!");
}else{
	sql="delete from a_projection_booking where id="+request.getParameter("id");
	flag=db.execUpdate(sql);
	if(flag==1){
		response.sendRedirect("projection_booking_view.jsp?msg=Cancel your booking successfully!");
	}else{
		response.sendRedirect("projection_booking_view.jsp?msg=Cancel your booking failure!");
	}
}
%>
</body>
<%db.close();%>
</html>