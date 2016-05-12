<%@ page import="java.sql.ResultSet" contentType="text/html; charset=gb2312" errorPage=""%>
<%@ page import="java.util.Date" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>Projection Reservation</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/projection.css" rel="stylesheet" type="text/css">
</head>
<script src="../js/projection.js" language="javascript" type="text/javascript"></script>
<%
Date date=new java.util.Date();
String sql=new String();
String id=new String();
id=request.getParameter("id");
DBean db = new DBean();
ResultSet rs1;
sql="select * from a_projection_booking where id="+id;
rs1=db.execSQL(sql);
%>
<body>
<%while(rs1.next()){%>
<center>
  <span class="font12"><strong><font color="#FFFFFF"><br>

  </font></strong></span>
  <table width="95%">
    <tr> 
      <td width="168"><img src="../images/logo_ebaotech.gif" width="200" height="50"></td>
      <td width="590"><div align="center"><span class="en"><strong><font color="#FF6600" size="4"> 
      Amend/Cancel Your Booking</font></strong></span></div></td>
    </tr>
  </table>
  <span class="font105"><br>
  </span> 
  <div align="left"><span class="font105"></span> </div>
</center>
<form name="form1" action="projection_done_upd.jsp" method="post">
<table width="98%" align="center" border="0">
  <tr>
      <td width="36%" height="394" valign="top"> 
        <center><b><font color="#FF0000" size="2" class="en"><font color="#FF0000"><%=Tools.toGB(request.getParameter("msg"))%></font></font></b></center>
        <table border="1" cellpadding="1" cellspacing="1" bordercolorlight="#00AEEF" bordercolordark="#E0E9FE">
          <tr bgcolor="00AEEF"> 
            <td class="en" colspan="2" width="300"><strong><font color="#FFFFFF">User Info.</font></strong></td>
          </tr>
          <tr> 
            <td class="en">Staff Code</td>
            <td class="en"><input type="text" name="tuser" value="<%=rs1.getString("tuser")%>" size="20" class="en"> 
              <br>(i.e.: 006)</td>
          </tr>
          <tr>
            <td class="en">Name</td>
            <td class="en"><input type="text" name="tname" value="<%=rs1.getString("tname")%>" size="20" class="en"></td>
          </tr>
          <tr> 
            <td class="en">Ext.</td>
            <td class="en"><input type="text" name="extension" value="<%=rs1.getString("extension")%>" size="20" class="en"></td>
          </tr>
          <tr> 
            <td class="en">Meeting Room</td>
            <td class="en">
			<select name="projection" onChange="changemap()" class="en">
				<option value="<%=rs1.getString("projection")%>"><%=rs1.getString("projection")%></option>
				<option value="SONY(1#)">SONY(1#)</option> 
				<option value="VIEW SONIC(3#)">VIEW SONIC(3#)</option> 
				<option value="TOSHIBA(4#)">TOSHIBA(4#)</option> 
				<option value="EPSON(5#)">EPSON(5#)</option> 
				<option value="SONY(6#)">SONY(6#)</option> 
				<option value="SONY(7#)">SONY(7#)</option> 
			</select>
			</td>
          </tr>
          <tr> 
            <td class="en">Date</td>
            <td class="en">
				<input type="text" name="projection_date" onFocus="show_cele_date(projection_date,'','',projection_date)" style="width:80" value="<%=rs1.getDate("start_datetime")%>" class="en">
			</td>
          </tr>
          <tr> 
            <td class="en">From</td>
            <td class="en">
			<select name="start_hour" class="en">
				<option value="<%=rs1.getTime("start_datetime").getHours()%>" selected><%=rs1.getTime("start_datetime").getHours()%></option>
				<%for(int l=0;l<=23;l++){%>
					<%if(rs1.getTime("start_datetime").getHours()!=l){%>
						<option value="<%=l%>"><%=l%></option>
					<%}%>
				<%}%>
			</select>:
			<select name="start_minute" class="en">
				<%if(rs1.getTime("start_datetime").getMinutes()!=30){%>
					<option value="00">00</option>
					<option value="30">30</option>
				<%}else{%>
					<option value="30">30</option>
					<option value="00">00</option>
				<%}%>
			</select>
			</td>
          </tr>
          <input type="hidden" name="end_year" value="">
		  <input type="hidden" name="end_month" value="">
		  <input type="hidden" name="end_day" value="">
          <tr> 
            <td class="en">To</td>
            <td class="en">
			<select name="end_hour" class="en">
				<option value="<%=rs1.getTime("end_datetime").getHours()%>" selected><%=rs1.getTime("end_datetime").getHours()%></option>
				<%for(int l=0;l<=23;l++){%>
					<%if(rs1.getTime("end_datetime").getHours()!=l){%>
						<option value="<%=l%>"><%=l%></option>
					<%}%>
				<%}%>
			</select>:
			<select name="end_minute" class="en">
				<%if(rs1.getTime("end_datetime").getMinutes()!=30){%>
					<option value="00">00</option>
					<option value="30">30</option>
				<%}else{%>
					<option value="30">30</option>
					<option value="00">00</option>
				<%}%>
			</select>
			</td>
          </tr>
          <tr>
            <td class="en">Password</td>
            <td class="en"><input type="password" name="updpassword" value="" size="20" class="en"></td>
          </tr>
        </table>
        <br>
        <br>
        <table border="1" cellspacing="1" cellpadding="1" bordercolorlight="#00AEEF" bordercolordark="#E0E9FE">
          <tr> 
            <td bgcolor="#00AEEF"><strong><font color="#FFFFFF">For Which Meeting Room 
              </font></strong> </td>
          </tr>
          <tr> 
            <td width="300"><textarea name="reason" cols="46" rows="5" class="en"><%=rs1.getString("reason")%></textarea></td>
          </tr>
        </table>
		<p align="center">
		  <a onClick="check1()"><img src="../images/update_button.gif" width="157" height="23" onMouseOver="this.style.cursor='hand';"></a><br><br>
		  <a onClick="check2()"><img src="../images/delete_button.gif" width="157" height="23" onMouseOver="this.style.cursor='hand';"></a><br><br>
		  <img src="../images/close.gif" border="0" onClick="window.close();" onMouseOver="this.style.cursor='hand';">
        </p>
	  </td>
	  <%if("SONY(1#)".equals(rs1.getString("projection"))){%>
	  	<td width="64%" align="center" valign="top" id="changetd"><img src="../images/SONY.jpg" border="0"></td> 
	  <%}%>
	  <%if("VIEW SONIC(3#)".equals(rs1.getString("projection"))){%>
	  	<td width="64%" align="center" valign="top" id="changetd"><img src="../images/VIEW SONIC.jpg" border="0"></td> 
	  <%}%>
	  <%if("TOSHIBA(4#)".equals(rs1.getString("projection"))){%>
	  	<td width="64%" align="center" valign="top" id="changetd"><img src="../images/TOSHIBA.jpg" border="0"></td> 
	  <%}%>
	  <%if("EPSON(5#)".equals(rs1.getString("projection"))){%>
	  	<td width="64%" align="center" valign="top" id="changetd"><img src="../images/EPSON.jpg" border="0"></td> 
	  <%}%>
	  <%if("SONY(6#)".equals(rs1.getString("projection"))){%>
	  	<td width="64%" align="center" valign="top" id="changetd"><img src="../images/SONY.jpg" border="0"></td> 
	  <%}%>
	  <%if("SONY(7#)".equals(rs1.getString("projection"))){%>
	  	<td width="64%" align="center" valign="top" id="changetd"><img src="../images/SONY.jpg" border="0"></td> 
	  <%}%>
  </tr>
<input name="start_year" type="hidden" value="">
<input name="start_month" type="hidden" value="">
<input name="start_day" type="hidden" value="">
<input type="hidden" name="id" value="<%=request.getParameter("id")%>">
</table>
</form>
<%}%>
</body>
<script language="javascript" src="../js/CheckData.js"></script>
<script language="JScript">
function changemap(){
	if(form1.projection.value==""){
		window.changetd.innerHTML="&nbsp;";
	}
	if(form1.projection.value=="SONY(1#)"){
		window.changetd.innerHTML="<img src=\"../images/SONY.jpg\" border=\"0\">";
	}
	if(form1.projection.value=="VIEW SONIC(3#)"){
		window.changetd.innerHTML="<img src=\"../images/VIEW SONIC.jpg\" border=\"0\">";
	}
	if(form1.projection.value=="TOSHIBA(4#)"){
		window.changetd.innerHTML="<img src=\"../images/TOSHIBA.jpg\" border=\"0\">";
	}
	if(form1.projection.value=="EPSON(5#)"){
		window.changetd.innerHTML="<img src=\"../images/EPSON.jpg\" border=\"0\">";
	}
	if(form1.projection.value=="SONY(6#)"){
		window.changetd.innerHTML="<img src=\"../images/SONY.jpg\" border=\"0\">";
	}
	if(form1.projection.value=="SONY(7#)"){
		window.changetd.innerHTML="<img src=\"../images/SONY.jpg\" border=\"0\">";
	}
}
function check1(){
	if(form1.tuser.value==""){
	 	alert("Please Enter Staff Code");
		form1.tuser.focus();
		return;
	}
	if(form1.tuser.value.length!=3){
	 	alert("Staff Code Error");
		form1.tuser.focus();
		return;
	}
	if(form1.tname.value==""){
	 	alert("Please Enter Staff Name");
		form1.tname.focus();
		return;
	}
	if(form1.extension.value==""){
	 	alert("Please Enter Ext.");
		form1.extension.focus();
		return;
	}
	if(form1.projection.value==""){
	 	alert("Please Select Projection");
		form1.projection.focus();
		return;
	}
	if(form1.projection_date.value==""){
		alert("Please Select Date");
		form1.projection_date.focus();
		return;
	}
	var today= new Date();
	var str_projection_date;
	str_projection_date = document.form1.projection_date.value;
	var arr_projection_date;
	var arr_projection_date = str_projection_date.split("-");
	var dateObj1 = new Date(arr_projection_date[0], arr_projection_date[1]-1, arr_projection_date[2], document.form1.start_hour.value, document.form1.start_minute.value, 0);
	var dateObj2 = new Date(arr_projection_date[0], arr_projection_date[1]-1, arr_projection_date[2], document.form1.end_hour.value, document.form1.end_minute.value, 0);
	if(today-dateObj1<=-604338735){
		alert("Please make your booking within one week, thanks!");
		form1.projection_date.focus();
		return;
	}
	if(today-dateObj1>=0){
		alert("Date Error");
		form1.start_hour.focus();
		return;
	}
	if(today-dateObj2>=0){
		alert("Date Error");
		form1.end_hour.focus();
		return;
	}
	if(dateObj1-dateObj2>=0){
		alert("Date Error");
		form1.end_hour.focus();
		return;
	}
	if(form1.updpassword.value==""){
	 	alert("Please Enter Your 'Edit' Password");
		form1.updpassword.focus();
		return;
	}
	if(form1.reason.value==""){
	 	alert("Please Enter Purpose");
		form1.reason.focus();
		return;
	}
	form1.start_year.value=arr_projection_date[0];
	form1.start_month.value=arr_projection_date[1];
	form1.start_day.value=arr_projection_date[2];
	form1.target.value="_blank";
	form1.submit();
}
function check2(){
	if(form1.updpassword.value==""){
	 	alert("Please Enter Your 'Edit' Password");
		form1.updpassword.focus();
		return;
	}
	form1.action="projection_del.jsp";
	form1.submit();
}
function view(){
	window.open('projection_booking_view.jsp','Pop','height=600, width=800, top=0, left=0, toolbar=yes, menubar=yes, scrollbars=yes, resizable=yes,location=no, status=yes');
}
</script>
</html>