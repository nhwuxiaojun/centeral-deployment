<%@ page import="java.sql.ResultSet" contentType="text/html; charset=gb2312" errorPage=""%>
<%@ page import="java.util.Date" %>
<%@ page import="ebao.Tools" %>
<html>
<head>
<title>Projection Reservation</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/projection.css" rel="stylesheet" type="text/css">
</head>
<script src="../js/projection.js" language="javascript" type="text/javascript"></script>
<body>
<%Date date=new java.util.Date();%>
<center>
  <span class="font12"><strong><font color="#FFFFFF"><br>

  </font></strong></span>
  <table width="95%">
    <tr> 
      <td width="168"><img src="../images/logo_ebaotech.gif" width="200" height="50"></td>
      <td width="590"><div align="center"><span class="en"><strong><font color="#FF6600" size="4"> 
      Projection Reservation</font></strong></span></div></td>
    </tr>
  </table>
  <span class="font105"><br>
  </span> 
  <div align="left"><span class="font105"></span> </div>
</center>
<form name="form1" action="projection_booking_done.jsp" method="post">
<table width="98%" align="center" border="0">
  <tr>
      <td width="36%" height="394" valign="top"> 
        <center><b><font color="#FF0000" size="2" class="en"><font color="#FF0000"><%=Tools.toGB(request.getParameter("msg"))%></font></font></b></center>
        <table width="305" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#00AEEF" bordercolordark="#E0E9FE">
          <tr bgcolor="00AEEF"> 
            <td class="en" colspan="2" width="300"><strong><font color="#FFFFFF">User Info.</font></strong></td>
          </tr>
          <tr> 
            <td class="en">Staff Code</td>
            <td class="en"><input type="text" name="tuser" value="<%=Tools.toGB(request.getParameter("tuser"))%>" size="20" class="en"> 
              <br>(i.e.: 006)</td>
          </tr>
          <tr>
            <td class="en">Name</td>
            <td class="en"><input type="text" name="tname" value="<%=Tools.toGB(request.getParameter("tname"))%>" size="20" class="en"></td>
          </tr>
          <tr> 
            <td class="en">Ext.</td>
            <td class="en"><input type="text" name="extension" value="<%=Tools.toGB(request.getParameter("extension"))%>" size="20" class="en"></td>
          </tr>
          <tr> 
            <td class="en">Projection</td>
            <td class="en">
			<select name="projection" onChange="changemap()" class="en">
				<%if("".equals(request.getParameter("projection"))||request.getParameter("projection")==null){%>
					<option value="">please select...</option> 
				<%}else{%>
					<option value="<%=request.getParameter("projection")%>"><%=request.getParameter("projection")%></option> 
				<%}%>
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
			<%if("".equals(request.getParameter("start_year"))||request.getParameter("start_year")==null){%>
				<input type="text" name="projection_date" onFocus="show_cele_date(projection_date,'','',projection_date)" style="width:80" class="en">
			<%}else{%>	
				<input type="text" name="projection_date" onFocus="show_cele_date(projection_date,'','',projection_date)" style="width:80" value="<%=request.getParameter("start_year")+"-"+request.getParameter("start_month")+"-"+request.getParameter("start_day")%>" class="en">
			<%}%>
			</td>
          </tr>
          <tr> 
            <td class="en">From</td>
            <td class="en">
			<select name="start_hour" class="en">
			<%if("".equals(request.getParameter("start_hour"))||request.getParameter("start_hour")==null){%>
				<%for(int l=0;l<=23;l++){%>
					<%if(date.getHours()==l){%>
						<option value="<%=l%>" selected><%=l%></option>
					<%}else{%>
						<option value="<%=l%>"><%=l%></option>
					<%}%>
				<%}%>
			<%}else{%>
				<option value="<%=request.getParameter("start_hour")%>" selected><%=request.getParameter("start_hour")%></option>
				<%for(int l=0;l<=23;l++){%>
					<%if(l!=Integer.parseInt(request.getParameter("start_hour"))){%>
						<option value="<%=l%>"><%=l%></option>
					<%}%>
				<%}%>
			<%}%>
			</select>:
			<select name="start_minute" class="en">
				<%if("".equals(request.getParameter("start_minute"))||request.getParameter("start_minute")==null){%>
					<option value="00">00</option>
					<option value="30">30</option>
				<%}else{%>
					<%if("00".equals(request.getParameter("start_minute"))){%>
						<option value="00">00</option>
						<option value="30">30</option>
					<%}else{%>
						<option value="30">30</option>
						<option value="00">00</option>
					<%}%>
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
			<%if("".equals(request.getParameter("end_hour"))||request.getParameter("end_hour")==null){%>
				<%for(int l=0;l<=23;l++){%>
					<%if(date.getHours()==l){%>
						<option value="<%=l%>" selected><%=l%></option>
					<%}else{%>
						<option value="<%=l%>"><%=l%></option>
					<%}%>
				<%}%>
			<%}else{%>
				<option value="<%=request.getParameter("end_hour")%>" selected><%=request.getParameter("end_hour")%></option>
				<%for(int l=0;l<=23;l++){%>
					<%if(l!=Integer.parseInt(request.getParameter("end_hour"))){%>
						<option value="<%=l%>"><%=l%></option>
					<%}%>
				<%}%>
			<%}%>
			</select>:
			<select name="end_minute" class="en">
				<%if("".equals(request.getParameter("end_minute"))||request.getParameter("end_minute")==null){%>
					<option value="00">00</option>
					<option value="30">30</option>
				<%}else{%>
					<%if("00".equals(request.getParameter("end_minute"))){%>
						<option value="00">00</option>
						<option value="30">30</option>
					<%}else{%>
						<option value="30">30</option>
						<option value="00">00</option>
					<%}%>
				<%}%>
			</select>
			</td>
          </tr>
          <tr> 
            <td class="en">Password</td>
            <td class="en"><input type="password" name="updpassword" value="" size="20" maxlength="6" class="en">&nbsp;&nbsp;1-6<br>(To "Amend" or "Cancel" <br>an existing Reservation.)</td>
          </tr>
        </table>
        <br>
        <br>
        <table width="264" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#00AEEF" bordercolordark="#E0E9FE">
          <tr> 
            <td bgcolor="#00AEEF" class="en"><strong><font color="#FFFFFF">For Which Meeting Room
              </font></strong></td>
          </tr>
          <tr> 
            <td width="305"><textarea name="reason" cols="45" rows="5" class="en"><%=Tools.toGB(request.getParameter("reason"))%></textarea></td>
          </tr>
        </table>
		<p align="center">&nbsp; 
		  <a onClick="check1()"><img src="../images/submit_button.gif" width="70" height="23" onMouseOver="this.style.cursor='hand';"></a>
		  <a onClick="view()"><img src="../images/book_button.gif" width="70" height="23" onMouseOver="this.style.cursor='hand';"></a>
        </p>
	  </td>
	  <td width="64%" align="center" valign="top" id="changetd">&nbsp;</td>
  </tr>
<input name="start_year" type="hidden" value="">
<input name="start_month" type="hidden" value="">
<input name="start_day" type="hidden" value="">
</table>
</form>
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
		form1.projection_date.focus();
		return;
	}
	if(today-dateObj2>=0){
		alert("Date Error");
		form1.projection_date.focus();
		return;
	}
	if(dateObj1-dateObj2>=0){
		alert("Date Error");
		form1.end_hour.focus();
		return;
	}
	if(form1.updpassword.value==""){
	 	alert("Please Enter Password");
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
function view(){
	window.open('projection_booking_view.jsp','Pop','height=600, width=800, top=0, left=0, toolbar=yes, menubar=yes, scrollbars=yes, resizable=yes,location=no, status=yes');
}
</script>
</html>