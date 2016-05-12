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
<script src="../js/projection2.js" language="javascript" type="text/javascript"></script>
<body>
<br><br><br>
<%
DBean db = new DBean();
ResultSet rs1;
Date date=new java.util.Date();
%>
<div align="center">
<table align="center" cellpadding="0" cellspacing="0" border="0">
<form name="form1" action="" method="post">
<tr>
	<td align="center" width="36%" class="en">Date： 
	<%if("".equals(request.getParameter("flag1"))||request.getParameter("flag1")==null){%>
		<input type="text" name="projection_date" onFocus="show_cele_date(projection_date,'','',projection_date)" style="width:80">
	<%}else{%>
		<input type="text" name="projection_date" onFocus="show_cele_date(projection_date,'','',projection_date)" style="width:80" value="<%=request.getParameter("projection_date")%>">
	<%}%>
	</td>
	<td width="45%" align="center" class="en">Projection：
	<select name="projection" class="en">
	<%if("".equals(request.getParameter("flag1"))||request.getParameter("flag1")==null){%>
		<option value="">All</option> 
		<option value="SONY(1#)">SONY(1#)</option> 
		<option value="VIEW SONIC(3#)">VIEW SONIC(3#)</option> 
		<option value="TOSHIBA(4#)">TOSHIBA(4#)</option> 
		<option value="EPSON(5#)">EPSON(5#)</option> 
		<option value="SONY(6#)">SONY(6#)</option> 
		<option value="SONY(7#)">SONY(7#)</option> 
	<%}else{%>
		<%if("".equals(request.getParameter("projection"))){%>
			<option value="">All</option> 
		<%}else{%>
			<option value="<%=request.getParameter("projection")%>"><%=request.getParameter("projection")%></option> 
			<option value="">All</option> 
		<%}%>
		<option value="SONY(1#)">SONY(1#)</option> 
		<option value="VIEW SONIC(3#)">VIEW SONIC(3#)</option> 
		<option value="TOSHIBA(4#)">TOSHIBA(4#)</option> 
		<option value="EPSON(5#)">EPSON(5#)</option> 
		<option value="SONY(6#)">SONY(6#)</option> 
		<option value="SONY(7#)">SONY(7#)</option> 
	<%}%>
	</select>
</td>
<td width="19%" align="center">&nbsp;&nbsp;&nbsp;&nbsp;
  <input type="button" name="button2" value="search>" onClick="query()" class="en"></td>
</tr>
<input type="hidden" name="flag1" value="1">
</form>
</table>
<br>
<br>
<center><b><font color="#FF0000" size="2" class="en"><font color="#FF0000"><%=Tools.toGB(request.getParameter("msg"))%></font></font></b></center>
<br>
<%
String sql1 = new String();
String datestr = new String();
DateFormat df=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
datestr=df.format(new java.util.Date());
if("".equals(request.getParameter("flag1"))||request.getParameter("flag1")==null){
	sql1="select * from a_projection_booking where end_datetime>to_date('"+datestr+"','yyyy-mm-dd hh24:mi:ss') order by projection,start_datetime";
}else{
	String projection_date = new String();
	String projection = new String();
	projection_date = request.getParameter("projection_date");
	projection = request.getParameter("projection");
	if(("".equals(request.getParameter("projection"))||request.getParameter("projection")==null)&&("".equals(request.getParameter("projection_date"))||request.getParameter("projection_date")==null)){
		sql1="select * from a_projection_booking where end_datetime>to_date('"+datestr+"','yyyy-mm-dd hh24:mi:ss') order by projection,start_datetime";
	}else{
		if("".equals(request.getParameter("projection"))||request.getParameter("projection")==null){
			sql1="select * from a_projection_booking where start_datetime like to_date('"+projection_date+"','yyyy-mm-dd') and end_datetime>to_date('"+datestr+"','yyyy-mm-dd hh24:mi:ss') order by projection,start_datetime";
		}else{
			if("".equals(request.getParameter("projection_date"))||request.getParameter("projection_date")==null){
				sql1="select * from a_projection_booking where end_datetime>to_date('"+datestr+"','yyyy-mm-dd hh24:mi:ss') and projection='" + projection + "' order by projection,start_datetime";
			}else{
				sql1="select * from a_projection_booking where end_datetime>to_date('"+datestr+"','yyyy-mm-dd hh24:mi:ss') and start_datetime like to_date('" + projection_date + "','yyyy-mm-dd') and projection='" + projection + "' order by projection,start_datetime";
			}
		}
	}
}
//out.println(sql1+"<br>");
rs1 = db.execSQL(sql1);
%>

<table border="1" align="center" width="90%" cellpadding="1" cellspacing="1" bordercolorlight="#00AEEF" bordercolordark="#E0E9FE">
  <tr bgcolor="#00AEEF"> 
    <td class="en" colspan="9" width="80%" align="center"><div align="center"><strong><font color="#FFFFFF">Projection Reservation Circumstance</font></strong></div></td>
  </tr>
  <tr> 
    <td class="en" align="center"><b>Staff Code</b></td> 
    <td class="en" align="center"><b>Name</b></td> 
	<td class="en" align="center"><b>Date</b></td> 
	<td class="en" align="center"><b>Time</b></td> 
	<td class="en" align="center"><b>Projection</b></td> 
	<td class="en" align="center"><b>Ext.</b></td> 
	<td class="en" align="center"><b>Purpose</b></td> 
	<td class="en" align="center"><b>Edit</b></td> 
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
	<td class="en" align="center"><a href="projection_upd.jsp?id=<%=rs1.getInt("id")%>"><u><font color="#FF0000">Edit</font></u></a></td> 
  </tr>
  <%}%>
</table>
<br><br>
<img src="../images/close1.gif" border="0" onClick="window.close();" onMouseOver="this.style.cursor='hand';">
</div>
</body>
<script language="javascript" src="../js/CheckData.js"></script>
<script language="JavaScript">
function query(){
	form1.submit();
}
</script>
<%db.close();%>
<%rs1.close();%>
</html>
