<%@ page import="java.sql.ResultSet" contentType="text/html; charset=gb2312" errorPage=""%>
<%@ page import="java.util.Date" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.text.DateFormat" %>
<html>
<head>
<title>Projection Reservation</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/projection.css" rel="stylesheet" type="text/css">
</head>
<body>
<br>
<%
DBean db = new DBean();
ResultSet rs1;
String sql1= new String();
String datestr = new String();
DateFormat df=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
datestr=df.format(new java.util.Date());
sql1="select * from a_projection_booking where end_datetime>to_date('"+datestr+"','yyyy-mm-dd hh24:mi:ss') order by projection,start_datetime";
rs1 = db.execSQL(sql1);
%>
<center>
<form action="" name="form1" method="post">
<div align="center"><span class="en"><strong><font color="#FF6600" size="4">Projection Reservation Circumstance</font></strong></span></div>
<br>
<center><b><font color="#FF0000" size="2" class="en"><font color="#FF0000"><%=Tools.toGB(request.getParameter("msg"))%></font></font></b></center>
<br>
<table border="1" align="center" width="90%" cellpadding="1" cellspacing="1" bordercolorlight="#00AEEF" bordercolordark="#E0E9FE">
  <tr bgcolor="#00AEEF"> 
    <td class="en" colspan="11" ><div align="center"><strong><font color="#FFFFFF">Projection Reservation Circumstance</font></strong></div></td>
  </tr>
  <tr> 
    <td class="en" align="center"><b>Staff Code</b></td> 
    <td class="en" align="center"><b>Name</b></td> 
	<td class="en" align="center"><b>Date</b></td> 
	<td class="en" align="center"><b>Time</b></td> 
	<td class="en" align="center"><b>Projection</b></td> 
	<td class="en" align="center"><b>Ext.</b></td> 
	<td class="en" align="center"><b>Purpose</b></td> 
	<td class="en" align="center"><b>Password</b></td> 
	<td class="en" align="center"><b>Edit</b></td> 
	<td class="en" align="center"><b>Cancel</b></td> 
  </tr>
  <%while(rs1.next()){%>
  <tr> 
    <td class="en" align="center"><%=rs1.getString("tuser")%></td>
    <td class="en" align="center"><%=rs1.getString("tname")%></td>
	<td class="en" align="center"><%=rs1.getDate("start_datetime")%></td>
	<td class="en" align="center"><%=String.valueOf(rs1.getTime("start_datetime")).substring(0,5)%>--<%=String.valueOf(rs1.getTime("end_datetime")).substring(0,5)%></td>
	<td class="en" align="center"><%=rs1.getString("projection")%></td>
	<td class="en" align="center"><%=rs1.getString("extension")%></td>
	<td class="en" align="center"><%=rs1.getString("reason").replace('>','》').replace('<','《')%></td>
	<td class="en" align="center"><%=rs1.getString("updpassword")%></td>
	<td class="en" align="center"><a href="projection_booking_upd.jsp?id=<%=rs1.getString("id")%>"><u><font color="#FF0000">Edit</font></u></a></td>
	<td class="en" align="center"><a href="#" onClick="del(<%=rs1.getString("id")%>)"><u><font color="#FF0000">Cancel</font></u></a></td>
  </tr>
  <%}%>
</table>
</form>
</center>
</body>
<script language="JavaScript">
function del(id){
	var aa=true;
	aa=confirm("Are you sure you want to cancel it?");
	if (aa==true){
		form1.action="projection_booking_del.jsp?id="+id;
		form1.submit();
	}
}
</script>
<%db.close();%>
<%rs1.close();%>
</html>
