<%@ page import="java.sql.ResultSet,java.sql.ResultSetMetaData" contentType="text/html; charset=gb2312" errorPage=""%>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.DecimalFormat" %>
<html>
<head>
<title>Deal with Booking</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>
<%
String tuser=request.getParameter("tuser");
request.setAttribute("tuser",tuser);
String tname=Tools.toGB(request.getParameter("tname"));
String extension=request.getParameter("extension");
String projection=request.getParameter("projection");
String start_year=request.getParameter("start_year");
String start_month=request.getParameter("start_month");
String start_day=request.getParameter("start_day");
String start_hour=request.getParameter("start_hour");
String start_minute=request.getParameter("start_minute");

String end_year=request.getParameter("start_year");
String end_month=request.getParameter("start_month");
String end_day=request.getParameter("start_day");

String end_hour=request.getParameter("end_hour");
String end_minute=request.getParameter("end_minute");
String reason=Tools.toGB(request.getParameter("reason"));
String updpassword=Tools.toGB(request.getParameter("updpassword"));
/**
out.println(tuser+"<br>");
out.println(tname+"<br>");
out.println(extension+"<br>");
out.println(projection+"<br>");
out.println(start_year+"<br>");
out.println(start_month+"<br>");
out.println(start_day+"<br>");
out.println(start_hour+"<br>");
out.println(start_minute+"<br>");
out.println(end_year+"<br>");
out.println(end_month+"<br>");
out.println(end_day+"<br>");
out.println(end_hour+"<br>");
out.println(end_minute+"<br>");
out.println(reason+"<br>");
*/
DBean db = new DBean();
ResultSet rs1;
ResultSet rs2;
String datestr = new String();
String sql = new String();
String sql1 = new String();
String sql2 = new String();
String start_date = new String();
String end_date = new String();
String start_date2 = new String();
String end_date2 = new String();
int id=0;
int flag1=0;
int flag2=0;
start_date = start_year + "-" + start_month + "-" + start_day + " " + start_hour + ":" + start_minute + ":00";
//out.print(start_date+"<br>");
end_date = end_year + "-" + end_month + "-" + end_day + " " + end_hour + ":" + end_minute + ":00";
//out.print(end_date+"<br>");

//judge conflicting
java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
Date start_Date = sdf.parse(start_date);
Date end_Date = sdf.parse(end_date);
Date start_Date2 = new Date();
Date end_Date2 = new Date();
sql="select * from a_projection_booking where projection='"+projection+"'";

rs1 = db.execSQL(sql);
while(rs1.next()){
	start_date2=rs1.getDate("start_datetime")+" "+rs1.getTime("start_datetime");
	end_date2=rs1.getDate("end_datetime")+" "+rs1.getTime("end_datetime");
	start_Date2 = sdf.parse(start_date2);
	end_Date2 = sdf.parse(end_date2);
	if(start_Date.compareTo(start_Date2)>0&&start_Date.compareTo(end_Date2)<0){
		flag1=1;
	}
	if(end_Date.compareTo(start_Date2)>0&&end_Date.compareTo(end_Date2)<0){
		flag1=2;
	}
	if(start_Date.compareTo(start_Date2)==0&&end_Date.compareTo(end_Date2)==0){
		flag1=3;
	}
}

rs1 = db.execSQL(sql);
while(rs1.next()){
	start_date2=rs1.getDate("start_datetime")+" "+rs1.getTime("start_datetime");
	end_date2=rs1.getDate("end_datetime")+" "+rs1.getTime("end_datetime");
	start_Date2 = sdf.parse(start_date2);
	end_Date2 = sdf.parse(end_date2);
	if(start_Date2.compareTo(start_Date)>0&&start_Date2.compareTo(end_Date)<0){
		flag1=4;
	}
	if(end_Date2.compareTo(start_Date)>0&&end_Date2.compareTo(end_Date)<0){
		flag1=5;
	}
}
//out.println(flag1+"<br>");
if(flag1==0){
	//get sequence
	sql1 = "select a_projection_booking__id.nextval as id from dual";
	rs2 = db.execSQL(sql1);
	if (rs2.next()) {
		id = rs2.getInt("id");
	}
	rs2.close();
	//insert record
	sql2="insert into a_projection_booking(id,tuser,tname,start_datetime,end_datetime,projection,extension,reason,updpassword)values("+id+",'"+tuser+"','"+tname+"',to_date('"+start_date+"','yyyy-mm-dd hh24:mi:ss'),to_date('"+end_date+"','yyyy-mm-dd hh24:mi:ss'),'"+projection+"','"+extension+"','"+reason+"','"+updpassword+"')";
	//out.println(sql2+"<br>");
	flag2=db.execUpdate(sql2);
	if(flag2==1){
		response.sendRedirect("projection_booking.jsp?msg=Your booking successfully!");
	}else{
		response.sendRedirect("projection_booking.jsp?msg=Your booking failure!");
	}
}else{
	response.sendRedirect("projection_booking.jsp?msg=Your booking failure(met conflicting)!&tuser="+tuser+"&tname="+tname+"&extension="+extension+"&projection="+projection+"&reason="+reason+"&start_year="+start_year+"&start_month="+start_month+"&start_day="+start_day+"&start_hour="+start_hour+"&start_minute="+start_minute+"&end_year="+end_year+"&end_month="+end_month+"&end_day="+end_day+"&end_hour="+end_hour+"&end_minute="+end_minute);
}
%>
</body>
<%db.close();%>
<%rs1.close();%>
</html>
