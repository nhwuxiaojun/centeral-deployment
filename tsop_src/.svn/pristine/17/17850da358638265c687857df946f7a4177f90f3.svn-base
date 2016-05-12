<%@ include file="../interface/check_non_ts.jsp"%>
<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="ebao.DBean" %>
<%@ page import="ebao.Tools" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>TS Member Query</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="../css/ebao_no_ts.css" rel="stylesheet" type="text/css">
<script src="../scripts/jquery-1.11.1.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {
$("#maintable tbody tr").hover(function() {
        // $("#maintable li:last").hover(function() {
                $(this).addClass("blue");
        }, function() {
                $(this).removeClass("blue");
        });
});
</script>
<style>
.blue {
        background:#ffff00;  
}
</style>
</head>
<script language="JavaScript">
function check(){
	if(form1.col_value1.value.length<2){
		alert("Please input more letters!");
		form1.col_value1.select();

	} else {
		form1.submit();
	}
}
function add(){
	window.location = "ts_member_add.jsp";
}
</script>
<script language="JavaScript" for="document" event="onkeypress">
	if(event.keyCode==13){
		check();
	}
</script>
<script language="JavaScript" for="window" event="onload">
        form1.col_value1.select();
</script>
<body>
<%@include file="head.jsp" %>
<%
DBean db = new DBean();
String sql = new String();
int sum = 0;
ResultSet rs;
ResultSet rs2;
String search_field=new String();
String search_value=new String();
search_field=request.getParameter("col_name1");
if (!(null==request.getParameter("col_value1"))) {
    search_value=request.getParameter("col_value1");
    search_value=search_value.replace(' ','%');
    search_value=search_value.replace('.','%');
}

if ("cname".equals(search_field)) {
	search_value = Tools.toGB(search_value.trim());
}
System.out.println("------------"+search_value+"---------------");
if (!"".equals(search_value)) { 
	sql = "select * from ts_member where resign=0 and upper(" + search_field + ") like upper('%" + search_value + "%') order by no";
} else sql = "select * from ts_member where resign=0 and 1=0 and upper(" + search_field + ") like upper('%" + search_value + "%') order by no";
	System.out.print(sql+"\n");
	rs = db.execSQL(sql);
%>

<center>
<table align="center" cellpadding="0" cellspacing="0" border="0" width="98%">
<form name="form1" action="" method="post" class="en">
<tr><td>&nbsp;</td></tr>
	<tr>
		<td align="left" class="title" width="20%">&nbsp;<strong><font color="#3333cc" class="MenuBarItemSubmenu">TS Member Query</font></strong> &nbsp;&nbsp;
		<select name="col_name1" class="en">
			<%if("".equals(request.getParameter("col_name1"))||request.getParameter("col_name1")==null){%>
				<option value="name">English Name</option>
				<option value="cname">Chinese Name</option>
			<%}else{%>
				<option value="name">English Name</option>
				<option value="cname">Chinese Name</option>
			<%}%>
		</select>
		<%if("".equals(request.getParameter("col_value1"))||request.getParameter("col_value1")==null){%>
			<input type="text" name="col_value1" value="" class="en" size="15">&nbsp;
		<%}else{%>
			<input type="text" name="col_value1" value="<%=Tools.toGB(request.getParameter("col_value1"))%>" class="en" size="15">&nbsp;
		<%}%><input type="button" name="button1" value="Query" class="en" onClick="check()">

		</td>
	</tr><input type="hidden" name="flag" value="y">
</form>
</table>


<table id="maintable" style="table-layout: fixed" width="98%" border="1" cellpadding="1" cellspacing="1" bordercolorlight="#9E9E9E" bordercolordark="#EFEFEF" align="center">
<thead>
	<tr bgcolor="#3333cc" height="24">
	  <td align="center" class="en" width="8%"><font color="#ffffff">No</font></td>
	  <td align="center" class="en" width="15%"><font color="#ffffff">English Name</font></td>
	  <td align="center" class="en" width="8%"><font color="#ffffff">Title</font></td>
	  <td align="center" class="en" width="15%"><font color="#ffffff">Mobile Phone</font></td>
	  <td align="center" class="en" width="8%"><font color="#ffffff">Extension No</font></td>
	  <td align="center" class="en" width="8%"><font color="#ffffff">eMail</font></td>
      <td align="center" class="en" width="10%"><font color="#ffffff">Supported Projects</font></td>
	</tr>
</thead>
<tbody>
	<%while(rs.next()){
		sum++;
		if ((sum%2)==1) {
			out.println("<tr bgcolor=#eeeeee height=20>");
		} else {
			out.println("<tr bgcolor=#ffffff height=20>");
		}
		%>
	  <td align="center" class="en"><%=sum%></td>
	  <td align="center" class="en"><%=rs.getString("NAME")%></td> 
	  <td align="center" class="en"><%=rs.getString("TITLE")%></td>
	  <td align="center" class="en"><%=rs.getLong("MOBILE1")%></td>
	  <td align="center" class="en"><%=rs.getLong("EXT")%></td>
	  <td align="center" class="en"><a href="mailto:<%=rs.getString("ACCOUNT")%>@ebaotech.com"><font color="#3333cc">Send eMail</a></td>
	<td align="center" class="en"><a href="ts_project_support_query.jsp?s_name=<%=rs.getLong("NO")%>&flag=print"><font color="#3333cc">See Details</a></td>


	</tr>
	<%}%>
    
</tbody>  
</table>
</center>
<%db.close();%>
<%rs.close();%>
<jsp:include page="copyright.jsp" />
</body>
</html>
